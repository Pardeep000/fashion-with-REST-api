import 'dart:convert';
import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model.dart';

// Future<model> apidata() async {
//   final url = "https://jsonplaceholder.typicode.com/albums/1";
//   var parsed_url = Uri.parse(url);
//   var response = await http.get(parsed_url);

//   if (response.statusCode == 200) {
//     var mapped_data = jsonDecode(response.body);
//     return model.fromMap(mapped_data);
//   } else {
//     throw Exception();
//   }
// }

// Future<model> post_request(String title) async {
//   final url = "https://jsonplaceholder.typicode.com/albums";
//   final parsed_url = Uri.parse(url);
//   //
//   var response = await http.post(parsed_url, body: {"title": title});
//   //
//   if (response.statusCode == 200) {
//     var mapped_data = jsonDecode(response.body);
//     // var mapped_data = response.body;
//     return model.fromMap(mapped_data);
//   } else {
//     throw Exception();
//   }
// }

// void main() => runApp();

// class runApp extends StatelessWidget {
//   const runApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "",
//       home: home(),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<model> createAlbum(String title) async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     // headers: <String, String>{
//     //   'Content-Type': 'application/json; charset=UTF-8',
//     // },
//     // body: jsonEncode(<String, String>{
//     //   'title': title,
//     // }),
//     body: {
//       "title":title
//     }
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return model.fromMap(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }







// -------------------------------------------------------------------





// class home extends StatelessWidget {
//   const home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: apidata(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final instance = snapshot.data;
//               print(instance);
//               return Text("${instance!.title}");
//             } else if (snapshot.hasError) {
//               print(snapshot.error);
//               return Text(snapshot.error.toString());
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }







// -------------------------------------------------------------------




// class bodyApp extends StatefulWidget {
//   const bodyApp({Key? key}) : super(key: key);

//   @override
//   State<bodyApp> createState() => _bodyAppState();
// }

// class _bodyAppState extends State<bodyApp> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loaddata();
//   }

//   void loaddata() async {
//     //string->map->list
//     var json = await rootBundle.loadString('assets/files/data.json');
//     var decoded_data = jsonDecode(json);
//     var listed_data = decoded_data["products"];
//     //
//     //model_list = List.from(listed_data).map<model>((e) => model.fromMap(e)).toList();
//     model_list =
//         List.from(listed_data).map<model>((e) => model.fromMap(e)).toList();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: model_list.length,
//         itemBuilder: (context, index) {
//           return dataset(
//             item: model_list[index],
//           );
//         },
//       ),
//     );
//   }
// }

// // class bodyApp extends StatelessWidget {
// //   const bodyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: ListView.builder(
// //         itemCount: other_list.length,
// //         itemBuilder: (context, index) {
// //           return dataset(item: other_list[index]);
// //         },
// //       ),
// //     );
// //   }
// // }

// class dataset extends StatelessWidget {
//   final model item;
//   const dataset({Key? key, required this.item}) : super(key: key);
//   final String cool = "wonderful";
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
//       shadowColor: Colors.purple,
//       color: Colors.blue,
//       shape: StadiumBorder(),
//       child: ListTile(
//         leading: Text(item.id.toString() + ")"),
//         title: Text(item.name),
//         subtitle: Text(item.desc),
//         trailing: Text("\$ ${item.century}"),
//       ),
//     );
//   }
// }
