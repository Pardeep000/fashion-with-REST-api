import 'package:flutter/cupertino.dart';

class carouselModel {
  final String percent;
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String img;

  carouselModel({
    required this.percent,
    required this.title,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.img,
  });
}

List<carouselModel> carouselList = [
  carouselModel(
    percent: "50%  ",
    title: "Shoes",
    text1: "when feet are comfortable",
    text2: "so is the ",
    text3: "mind, body and the soul",
    img: "assets/images/shoe.jpg",
  ),
  carouselModel(
    percent: "30%  ",
    title: "Iphone",
    text1: "The powerful devices",
    text2: "that enables you",
    text3: "to do more and differently",
    img: "assets/images/iphone.jpg",
  ),
  carouselModel(
      percent: "45%  ",
      title: "Watches",
      text1: "Wear it to show",
      text2: "the values and attitude",
      text3: "and to know value of time",
      img: "assets/images/watch.jpg"),
  carouselModel(
      percent: "30%  ",
      title: "Jacket",
      text1: "Be yourself and look",
      text2: "great and expect more ",
      text3: "from your clothings",
      img: "assets/images/jacket.jpg"),
];
