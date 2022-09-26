import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pk_practice/get_class.dart';

class detail extends StatelessWidget {
  detail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: detail_body(),
    );
  }
}

class detail_body extends StatelessWidget {
  detail_body({super.key});

  final GetClass instance = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('go back')),
            SizedBox(
              height: 20,
            ),
            Text("${instance.x}"),
          ],
        ),
      ),
    );
  }
}
