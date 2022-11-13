import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/custom_text.dart';
import '../screens/home2/thanawy_layouts/bottom_bar.dart';

class VodafoneCash extends StatelessWidget {
  String name, email, courseName, courseChapter, status, total, prem;
  bool premuim;

  VodafoneCash({
    required this.name,
    required this.email,
    required this.courseName,
    required this.courseChapter,
    required this.status,
    required this.premuim,
    required this.total,
    required this.prem,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool press = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    //TextEditingController  moneyController=TextEditingController();
    TextEditingController numController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        toolbarHeight: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Text(
                  "ادفع باستخدام فودافون كاش",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Reboto"),
                ),

                SizedBox(
                  height: 10,
                ),

                Text(
                  "ارسل الاجمالي لرقم فودافون كاش",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Reboto"),
                ),
                //  SizedBox(height: 5),

                Text(
                  "رقم فودافون كاش الخاص بنا".tr,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 60),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      "01141830480",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Spacer(),
                    // InkWell(
                    //     child: Container(
                    //         height: 30,
                    //         width: 90,
                    //         child: Image.asset('assets/images/copy.jpg')),
                    //     onTap: () {
                    //       //FlutterClipboard.copy("01141830480")
                    //       //    .then((value) => print('copied'));
                    //       Get.snackbar(
                    //         'Done',
                    //         ' Copied',
                    //         backgroundColor: Colors.black,
                    //         colorText: Colors.white,
                    //       );
                    //     })
                  ],
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "أدخل بريدك الإلكتروني".tr,
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                  ),
                  onSaved: (value) {
                    nameController != value;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(width: 20),
                TextFormField(
                  controller: numController,
                  decoration: InputDecoration(
                    hintText: "رقم المحفظة المرسل ".tr,
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                  ),
                  onSaved: (value) {
                    numController != value;
                  },
                ),

                SizedBox(height: 20),
                Center(
                  child: Text(
                    "لا تضغط على التفعيل حتى ترسل المجموع إلى رقم فودافون كاش",
                    style: TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),

                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        // Custom_Text(
                        //   text: "الاجمالي".tr,
                        //   fontSize: 24,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Custom_Text(
                        //   text: price,
                        //   fontSize: 20,
                        //   color: Color.fromARGB(255, 116, 27, 27),
                        // ),
                      ],
                    ),
                    Container(
                        //   alignment: Alignment.center,
                        width: 180,
                        height: 60,
                        child: RaisedButton(
                            color: Color.fromARGB(255, 116, 27, 27),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              "تفعيـل الاشتراك".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Reboto"),
                            ),
                            onPressed: () async {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                FirebaseFirestore.instance.collection('pay');

                                await FirebaseFirestore.instance
                                    .collection('paycash')
                                    .add({
                                  'name': name,
                                  "email": email,
                                  // "status": "done paid by cash",
                                  "courseName": courseName,
                                  "courseChapter": courseChapter,
                                  "total": total,
                                  // "premuim": premuim,
                                  "prem": prem,
                                  "walletnumber": numController.text,
                                  // 'key': "paid"
                                }).then((value) {
                                  Get.snackbar("Done", "sent".tr,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.black,
                                      duration: Duration(seconds: 3),
                                      borderRadius: 10,
                                      margin: EdgeInsets.all(10),
                                      borderColor: Colors.black,
                                      borderWidth: 2,
                                      icon: Icon(Icons.add_task,
                                          color: Colors.white));

                                  Get.off(BottomBar());
                                });
                              }
                            }))
                  ],
                ),

                //           // final CollectionReference _updates =
                //           //     FirebaseFirestore.instance.collection('user');
                //           //
                //           //     await _updates //.where('course',isEqualTo:'ahmed')
                //           //         .where('email',isEqualTo:email)
                //           //         .get().then((snapshot) {
                //           //           coursex.add(doctorname);
                //           //           print('vvv='+coursex.toString());
                //           //       snapshot.docs.last.reference.update({
                //           //         'pay':true,
                //           //          'course':coursex,
                //           //           //'price':price,
                //           //       }).then((value) {
                //           //         Get.off( BottomBar());
                //           //
                //           //       });
                //           //    });

                //         } else {
                //           Get.snackbar("Error", "wrong information".tr,
                //               snackPosition: SnackPosition.BOTTOM,
                //               backgroundColor: Colors.red,
                //               borderRadius: 10,
                //               margin: EdgeInsets.all(10),
                //               borderColor: Colors.red,
                //               borderWidth: 2,
                //               icon: Icon(Icons.error, color: Colors.white));
                //         }
                //         //press=false;
                //         // }
                //       }),
                // ),
                //    _listViewCodes(),
                //  SizedBox(height: 15),
              ]),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 230),
        child: FloatingActionButton(
          child: Icon(
            Icons.contact_support,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          onPressed: () async {
            launcherWhatsapp('+201141830480', 'I want active course'); // }
          },
        ),
      ),
    );
  }

  void launcherWhatsapp(@required phone, @required msg) async {
    String url = 'whatsapp://send?phone=$phone&text=$msg';
    await canLaunch(url) ? launch(url) : launch(url);
  }
}


//  Text(
//                   "Total".tr + " = " + price,
//                   style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "Reboto"),
//                 ),