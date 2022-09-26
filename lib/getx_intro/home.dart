import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//
import 'package:get/get.dart';
import 'package:pk_practice/detail.dart';
import 'package:pk_practice/get_binding.dart';

import 'get_class.dart';

class home extends StatelessWidget {
  home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home_body(),
    );
  }
}

class home_body extends StatelessWidget {
  home_body({
    super.key,
  });

  final GetClass instance = Get.find();

  void func1() {  
    Get.toNamed("/detail");
  }

  void func2() {
    instance.change();
  }

  void func3() {
    Get.snackbar("Snackbar", "coming from getx",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text("${instance.x}")),
          custom_button(
              text: "Move to detail", func: func1, color: Colors.blue),
          custom_button(text: "Increment", func: func2, color: Colors.red),
          custom_button(text: "snackbar", func: func3, color: Colors.purple)
        ],
      ),
    );
  }
}

class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    required this.text,
    required this.func,
    required this.color,
  });
  final Color color;
  final String text;
  final Function() func;
  // final VoidCallback callback;
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: func,
        child: Text(
          text,
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
            backgroundColor: color,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
      ),
    );
  }
}
