import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pk_practice/product.dart';

import 'all_productModel.dart';
import 'customAppbar.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //
    return Scaffold(
        appBar: PreferredSize(
            child: customAppbar(
              title: "CATEGORIES",
              icon: IconlyBold.arrowLeft3,
              func2: () {
                Navigator.of(context).pop();
              },
            ),
            preferredSize: Size(double.infinity, size.height)),
        body: category_body());
  }
}

class category_body extends StatelessWidget {
  const category_body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .6,
            // mainAxisExtent: 2,
            crossAxisSpacing: 10),
        itemCount: allproductList.length,
        // itemCount: 2,
        itemBuilder: (context, index) {
          return category_product(item: allproductList[index]);
        },
      ),
    );
  }
}

class category_product extends StatelessWidget {
  const category_product({super.key, required this.item});
  final allProductModel item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            width: size.width * 0.5,
            height: size.height * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                item.img1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width * 0.5,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              item.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
