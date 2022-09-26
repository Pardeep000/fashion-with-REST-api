import 'dart:convert';
import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

Future<model> post_request(String id, String title, String body) async {
  final url = "http://jsonplaceholder.typicode.com/posts";
  final parsed_url = Uri.parse(url);
  //
  var response = await http.post(parsed_url, body: {
    "id": id,
    "title": title,
    "body": body,
  });
  //
  if (response.statusCode == 201) {
    var mapped_data = jsonDecode(response.body);
    print(mapped_data);
    // var mapped_data = response.body;
    return model.fromMap(mapped_data);
  } else {
    throw Exception();
  }
}

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "struggling",
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
  model? _model;

  final TextEditingController id = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  void func() async {
    model localdata = await post_request(id.text, title.text, body.text);
    setState(() {
      _model = localdata;
      print('func is passed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: (_model == null) ? userInput() : displayData(),
      ),
    );
  }

  userInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        custom_field(data: id, text: "Write ID"),
        custom_field(data: title, text: "Write TITLE"),
        custom_field(data: body, text: "Write BODY"),
        submit_button(func: func),
      ],
    );
  }

  displayData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('ID => ${_model!.id}'),
        Text('TITLE => ${_model!.title}'),
        Text('BODY => ${_model!.body}'),
      ],
    );
  }
} //

// ------------------------------------------------------------------------------------

class custom_field extends StatelessWidget {
  const custom_field({
    super.key,
    required this.data,
    required this.text,
  });

  final String text;
  final TextEditingController data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
      child: TextField(
        controller: data,
        decoration: InputDecoration(
          hintText: text,
        ),
      ),
    );
  }
}

class submit_button extends StatelessWidget {
  const submit_button({super.key, required this.func});

  final Function()? func;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: func,
        child: Text('submit'),
      ),
    );
  }
}
