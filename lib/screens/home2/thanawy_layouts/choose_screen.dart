import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanawy2022/resources/color_manager.dart';
import 'package:thanawy2022/screens/home2/thanawy_layouts/subject2.dart';
import 'package:thanawy2022/widgets/carosoul.dart';
import 'package:thanawy2022/widgets/custom_text.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  late AdmobInterstitial interstitialAd;
  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      //ca-app-pub-6262607150176210/2180112332
      adUnitId: 'ca-app-pub-7757590907378676/5264737373',
      // 'ca-app-pub-3940256099942544/1033173712',
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );
    interstitialAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Carsoul(),
        SizedBox(
          height: 60,
        ),
        InkWell(
          child: AnimatedContainer(
            width: 160,
            height: 48,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                  colors: [ColorManager.primary, ColorManager.kFontLight]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "علمي",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            // child: Card(
            //   color: ColorManager.primary,
            //   child: Custom_Text(
            //       text: "علمي",
            //       color: ColorManager.white,
            //       fontSize: 20,
            //       alignment: Alignment.center),
            // ),
          ),
          onTap: () async {
            final isLoaded = await interstitialAd.isLoaded;
            if (isLoaded ?? false) {
              interstitialAd.show();
            } else {
              print("not loaded");
            }

            Get.to(Subject2(
              cat: 'ادبي',
              year: '3',
            ));
          },
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          child: AnimatedContainer(
            width: 160,
            height: 48,
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                  colors: [ColorManager.kFontLight, ColorManager.primary]),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ادبي",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            // child: Card(
            //   color: ColorManager.primary,
            //   child: Custom_Text(
            //       text: "ادبي",
            //       color: ColorManager.white,
            //       fontSize: 20,
            //       alignment: Alignment.center),
            // ),
          ),
          onTap: () {
            Get.to(Subject2(
              cat: 'علمي',
              year: '3',
            ));
          },
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: AdmobBanner(
            adUnitId: 'ca-app-pub-7757590907378676/2830145723',
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic>? args) {},
            onBannerCreated: (AdmobBannerController controller) {},
          ),
        ),
      ],
    );
  }
}
