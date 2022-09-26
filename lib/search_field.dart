import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class searchField extends StatelessWidget {
  const searchField({super.key, required this.search});
  final TextEditingController search;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 20, right: 20),
      child: TextField(
        controller: search,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            labelText: "Search",
            hintText: "see what you can find",
            suffixIcon: Icon(IconlyLight.search),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(25),
            ),
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
