import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'all_product_screen.dart';
import 'product_model.dart';

class allproductsStrip extends StatelessWidget {
  const allproductsStrip({super.key,required this.list});
final List<Product> list;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 12),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 115, 207, 235),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => allproductsScreen(list: list)));
          },
          splashColor: Colors.purple,
          child: Container(
            height: size.height * 0.06,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Click to view all products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Container(
                  child: Icon(
                    IconlyBold.arrowRight2,
                    color: Colors.red,
                  ),
                  margin: EdgeInsets.only(bottom: 6),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
