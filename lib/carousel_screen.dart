import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pk_practice/carousel_model.dart';



class carouselContainer extends StatelessWidget {
  const carouselContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.35,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Swiper(
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.topCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.white, activeColor: Colors.red),
            margin: EdgeInsets.only(top: 25)),
        scrollDirection: Axis.horizontal,
        itemCount: carouselList.length,
        itemBuilder: (context, index) {
          return carousel_screen(item: carouselList[index]);
        },
      ),
    );
  }
}




class carousel_screen extends StatelessWidget {
  const carousel_screen({super.key, required this.item});
  final carouselModel item;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Image.asset(item.img, fit: BoxFit.fill)),
        ),
        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: topContent(percent: item.percent,title: item.title,text1: item.text1,text2: item.text2,text3: item.text3,),
        ),
      ],
    );
  }
}

class topContent extends StatelessWidget {
  const topContent({super.key,required this.percent, required this.title, required this.text1, required this.text2, required this.text3});
  final String percent, title, text1, text2, text3;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        left_part(
          percent: percent,
        ),
        right_part(
          title: title,
          text1: text1,
          text2: text2,
          text3: text3,
        )
      ],
    );
  }
}

class left_part extends StatelessWidget {
  const left_part({super.key, required this.percent});
  final String percent;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.only(left: 20, top: 15),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.red,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: percent,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            //
            TextSpan(
                text: "\n     off",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ])),
        ));
  }
}

class right_part extends StatelessWidget {
  const right_part(
      {super.key,
      required this.title,
      required this.text1,
      required this.text2,
      required this.text3});
  final String title, text1, text2, text3;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bobbers',
                ),
                child: AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(text1),
                  TyperAnimatedText(text2),
                  TyperAnimatedText(text3),
                ]))
          ],
        ));
  }
}
