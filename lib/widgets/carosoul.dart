import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:thanawy2022/resources/color_manager.dart';

Widget Carsoul() {
  return CarouselSlider(
    options: CarouselOptions(height: 150.0, autoPlay: true),
    items: [
      'https://t4.ftcdn.net/jpg/03/98/12/71/360_F_398127142_XSq56acG9gNhJoeqH0QyGhlnw2SQYOuw.jpg',
      'https://img.freepik.com/free-vector/hand-drawn-english-book-background_23-2149483338.jpg?w=2000',
      'https://www.diblomaasi.com/wp-content/uploads/2020/04/physics-chalkboard_cropped.jpg',
      'https://us.123rf.com/450wm/promasud/promasud2108/promasud210800098/173351231-french-language-typography-with-france-national-flag-.jpg?ver=6',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgcxNyl5Z3tcJzhFoQ7Pvwd6SMSI8HucPe0A&usqp=CAU',
      'https://st2.depositphotos.com/3580719/9679/v/950/depositphotos_96792934-stock-illustration-seamless-background-on-a-theme.jpg',
      "https://wallpaperaccess.com/full/2496029.jpg"
    ].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(color: ColorManager.primary),
              child: Image.network(
                i,
                fit: BoxFit.fill,
              ));
        },
      );
    }).toList(),
  );
}
