import 'dart:convert';

import 'package:flutter/material.dart';
import 'newModel.dart';
import 'package:http/http.dart' as http;

//https://jsonplaceholder.typicode.com/photos/1
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  // List<Model>? _list;
  Model? _instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    final String url = "https://jsonplaceholder.typicode.com/photos/1";
    final Uri parsed_url = Uri.parse(url);
    var response = await http.get(parsed_url);
    //
    var jsondata = jsonDecode(response.body);
    var localdata = Model.fromJson(jsondata);
    // print(jsondata);
    setState(() {
      _instance = localdata;
      print(_instance!.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_instance == null)
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Center(child: Text("${_instance!.title}")),
            ),
    );
  }
}
