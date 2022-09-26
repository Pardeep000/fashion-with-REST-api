import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pk_practice/api_starter_but_left/model.dart';
import 'package:pk_practice/carousel_screen.dart';
import 'package:pk_practice/customAppbar.dart';
import 'package:pk_practice/search_field.dart';

import 'all_product_screen.dart';
import 'allproduct_strip.dart';
import 'carousel_model.dart';
import 'category.dart';
import 'product.dart';
import 'product_model.dart';
//
import 'package:http/http.dart' as http;

import 'user.dart';

class productDetail extends StatelessWidget {
  const productDetail({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: customAppbar(
            icon: IconlyBold.arrowLeft3,
            title: "Product Description",
            func1: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => categoryScreen()));
            },
            func2: () {
              print("click click");
              Navigator.of(context).pop();
            },
          ),
          preferredSize: Size(double.infinity, size.height)),
      body: detailScreen(item: item),
    );
  }
}

class detailScreen extends StatelessWidget {
  const detailScreen({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 102, 64, 64),
        Color.fromARGB(255, 37, 88, 131),
        Color.fromARGB(255, 230, 133, 126)
      ])),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            top_product_part(
              title: item.title!,
              price: item.price!,
            ),
            productPicture(image: item.image!),
            descriptive_part(desc: item.description!,)
          ],
        ),
      ),
    );
  }
}

class top_product_part extends StatelessWidget {
  const top_product_part({super.key, required this.title, required this.price});
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      // color: Colors.orange,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        children: [
          price_tag(
            price: price,
          ),
          name_tag(title: title),
        ],
      ),
    );
  }
}

class price_tag extends StatelessWidget {
  const price_tag({super.key, required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 45),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )),
      child: Text(
        "Price: \$ 1234",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class name_tag extends StatelessWidget {
  const name_tag({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Text(
        "Hoodies",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class productPicture extends StatelessWidget {
  const productPicture({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, right: 75),
        height: MediaQuery.of(context).size.height * 0.4,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            )));
  }
}

class descriptive_part extends StatelessWidget {
  const descriptive_part({super.key,required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 19, 17, 17),
      ),
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.4,
      child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(desc),
          ])),
    );
  }
}
