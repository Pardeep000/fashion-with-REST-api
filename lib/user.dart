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
import 'product_model.dart';
//
import 'package:http/http.dart' as http;

import 'userModel.dart';

class userScreen extends StatefulWidget {
  const userScreen({super.key});

  @override
  State<userScreen> createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {
  List<UserModel>? _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchproducts();
  }

  Future<void> fetchproducts() async {
    final String url = "https://fakestoreapi.com/users";
    final Uri parsed_url = Uri.parse(url);
    var response = await http.get(parsed_url);
    //
    List<UserModel> locallist = userModelFromJson(response.body);
    setState(() {
      _list = locallist;
      print(_list);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          child: customAppbar(
            icon: IconlyBold.arrowLeft3,
            title: "USERS",
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
      body: (_list == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                return userContainer(item: _list![index]);
              },
              separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.blue,
                  ),
              itemCount: _list!.length),
    );
  }
}

class userContainer extends StatelessWidget {
  const userContainer({super.key, required this.item});
  final UserModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.white, Colors.black])),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        color: Color.fromARGB(255, 214, 104, 104),
        child: dataset(item: item),
      ),
    );
  }
}

class dataset extends StatelessWidget {
  const dataset({super.key, required this.item});
  final UserModel item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          padding: EdgeInsets.only(top: 5),
          child: CircleAvatar(
              radius: 25,
              child: Icon(
                IconlyBold.user3,
                color: Colors.white,
                size: 35,
              ))),
      title: Text(
        "${item.username}",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontStyle: FontStyle.italic),
      ),
      subtitle: Text(
        "${item.email}",
        style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 56, 52, 52)),
      ),
      trailing: Text("user:${item.id}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }
}
