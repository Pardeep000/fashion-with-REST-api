import 'dart:html';

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
import 'product_in_detail_screen.dart';
import 'product_model.dart';
//
import 'package:http/http.dart' as http;

import 'user.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Struggling-demo",
      debugShowCheckedModeBanner: false,
      // home: userScreen(),
      // home: productDetail(),
      // home: allproductsScreen(),
      // home: categoryScreen(),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late TextEditingController searchkey;
  List<Product>? _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchkey = TextEditingController();
    fetchproducts();
  }

  Future<void> fetchproducts() async {
    final String url = "https://fakestoreapi.com/products";
    final Uri parsed_url = Uri.parse(url);
    var response = await http.get(parsed_url);
    //
    List<Product> locallist = productFromJson(response.body);
    setState(() {
      _list = locallist;
      // print(_list);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchkey.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 131, 128, 124),
        appBar: PreferredSize(
            child: customAppbar(
              icon: IconlyBold.user3,
              title: "HOME",
              func1: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => categoryScreen()));
              },
              func2: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userScreen()));
              },
            ),
            preferredSize: Size(double.infinity, size.height)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              searchField(search: searchkey),
              //
              carouselContainer(),
              //
              (_list == null)
                  ? CircularProgressIndicator()
                  : allproductsStrip(list: _list!),
              //
              (_list == null)
                  ? CircularProgressIndicator()
                  : productContainer(list: _list!),
            ],
          ),
        ),
      ),
    );
  }
}
