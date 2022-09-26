import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pk_practice/model.dart';
import 'package:pk_practice/pop_up.dart';
import 'package:pk_practice/tile_detail.dart';
//
import 'package:get_it/get_it.dart';

String time_formatter(DateTime data) {
  return "${data.day}/${data.month}/${data.year}  - ${data.hour}:${data.minute}:${data.second}";
}

void locationSetter(){
  GetIt.instance.registerSingleton<AppModel>(AppModel());
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tile_detail(id: 0)));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 2,
            color: Colors.red,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return dataset(item: list[index]);
          },
        ),
      ),
    );
  }
}

class dataset extends StatelessWidget {
  const dataset({super.key, required this.item});
  final model item;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      )),
      color: Colors.grey,
      child: new_listTile(item: item),
    );
  }
}

class new_listTile extends StatelessWidget {
  const new_listTile({super.key, required this.item});
  final model item;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (value) {},
      confirmDismiss: (value) async {
        final response = await showDialog(
          context: context,
          builder: (context) => pop_up(),
        );
        return response;
      },
      background: Container(
        padding: EdgeInsets.only(left: 15),
        color: Colors.red,
        child: Align(
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => tile_detail(id: item.id)));
        },
        title: Center(child: Text(item.title)),
        subtitle: Center(
            child:
                Text("Lasted edited on: ${time_formatter(item.updatedTime)}")),
      ),
    );
  }
}
