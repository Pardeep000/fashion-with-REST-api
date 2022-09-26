// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}




// import 'package:flutter/cupertino.dart';

// class productModel {
//   final String title;
//   final String desc;
//   final String price;
//   final String img;

//   productModel({
//     required this.title,
//     required this.desc,
//     required this.price,
//     required this.img,
//   });
// }

// List<productModel> productList = [
//   productModel(
//       title: "Jacket",
//       desc: "Korean Jacket with leather fitting",
//       price: "1453",
//       img: "assets/images/p1.webp"),
//   productModel(
//       title: "Shoes",
//       desc: "Nike Sportswear Club Fleece Joggers",
//       price: "1233",
//       img: "assets/images/p2.jpg"),
//   productModel(
//       title: "Glasses",
//       desc: "DITA LXN EVO spring",
//       price: "1423",
//       img: "assets/images/p3.jpg"),
//   productModel(
//       title: "Hoodies",
//       desc: "Belstaff Loopback Hoodie Navy",
//       price: "1723",
//       img: "assets/images/p4.jpg"),
// ];
