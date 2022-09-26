import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class tile_detail extends StatelessWidget {
  const tile_detail({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            (id == 0) ? Text("Create New note") : Text("Update Current note"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: detail_body(),
    );
  }
}

class detail_body extends StatelessWidget {
  detail_body({super.key});
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          custom_field(
            datakey: title,
            hint: "Write title of note",
            label: "Title",
          ),
          custom_field(
            datakey: content,
            hint: "Write content of note",
            label: "Content",
          ),
          custom_button(),
        ],
      ),
    );
  }
}

class custom_field extends StatelessWidget {
  const custom_field({
    super.key,
    required this.datakey,
    required this.hint,
    required this.label,
  });
  //
  final TextEditingController datakey;
  final String hint;
  final String label;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width*0.25),
      child: TextField(
        controller: datakey,
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.green))),
      ),
    );
  }
}

class custom_button extends StatelessWidget {
  const custom_button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('update'),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 35),
        ),
      ),
    );
  }
}
