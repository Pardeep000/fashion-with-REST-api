// class model {
//   final int id;
//   final String name;
//   final String century;
//   final String desc;

//   model(
//       {required this.id,
//       required this.name,
//       required this.century,
//       required this.desc});
//   //
//   factory model.fromMap(Map<String, dynamic> map) {
//     return model(
//         id: map['id'],
//         name: map['name'],
//         century: map['century'],
//         desc: map['desc']);
//   }
// }

// List<model> model_list = [];

class model {
  final int id;
  final String title;

  model({required this.id, required this.title});

  //mapping
  factory model.fromMap(Map<String, dynamic> map) {
    return model(id: map['id'], title: map['title']);
  }
}
