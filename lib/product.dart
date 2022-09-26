import 'dart:html';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pk_practice/carousel_model.dart';
import 'package:pk_practice/product_model.dart';

import 'product_in_detail_screen.dart';

class productContainer extends StatelessWidget {
  const productContainer({super.key, required this.list});
  final List<Product> list;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5),
      // itemCount: list.length,
      itemCount: 4,
      itemBuilder: (context, index) {
        return product(item: list[index]);
      },
    );
  }
}

class product extends StatelessWidget {
  const product({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(25),
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => productDetail(item: item,)));
        },
        splashColor: Colors.purple,
        child: Container(
          width: size.width * 0.6,
          height: size.height * 0.35,
          child: Column(
            children: [
              header(
                price: item.price.toString(),
              ),
              middleImage(img: item.image!),
              footer_strip(title: item.title!),
              footer(desc: item.description!),
            ],
          ),
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "\$ ", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: price, style: TextStyle(fontWeight: FontWeight.bold)),
          ])),
          Icon(
            IconlyBold.heart,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class middleImage extends StatelessWidget {
  const middleImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.19,
      width: size.width * 0.6,
      child: Image.network(
        img,
        fit: BoxFit.fill,
      ),
    );
  }
}

class footer_strip extends StatelessWidget {
  const footer_strip({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.04,
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        )));
  }
}

class footer extends StatelessWidget {
  const footer({super.key, required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Center(
          child: Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      )),
    );
  }
}
