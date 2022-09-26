import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:http/http.dart' as http;

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
  List<Product>? _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    final String url = "https://jsonplaceholder.typicode.com/users";
    final Uri parsed_url = Uri.parse(url);
    var response = await http.get(parsed_url);
    //
    List<Product> localList = productFromJson(response.body);
    setState(() {
      _list = localList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_list == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _list!.length,
              itemBuilder: (context, index) {
                return dataset(item: _list![index]);
              },
            ),
    );
  }
}

class dataset extends StatelessWidget {
  const dataset({super.key, required this.item});
  final Product item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("${item.id}"),
      title: Text("${item.name}"),
      subtitle: Text("${item.email}"),
    );
  }
}
