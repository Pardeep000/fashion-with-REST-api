import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail.dart';
import 'get_binding.dart';
import 'home.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'demo',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/Home/', page: () => Home()),
        GetPage(name: '/home/', page: () => home(), binding: GetBinding()),
        GetPage(name: '/detail/', page: () => detail())
      ],
      // home: home(),
      initialRoute: "/home",
      // home:home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: IconButton(
          onPressed: () {
            Get.toNamed("/home");
          },
          icon: Icon(Icons.arrow_circle_up),
        )),
      ),
    );
  }
}
