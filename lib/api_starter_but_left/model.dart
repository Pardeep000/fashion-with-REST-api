class model {
  final int id;
  final String title;
  final String content;
  final DateTime creationTime;
  final DateTime updatedTime;

  model(
      {required this.id,
      required this.title,
      required this.content,
      required this.creationTime,
      required this.updatedTime});
}

String time_formatter(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

List<model> list = [
  model(
      id: 1,
      title: 'note 1',
      content: 'about note-1',
      creationTime: DateTime.now(),
      updatedTime: DateTime.now()),
  model(
      id: 2,
      title: 'note 2',
      content: 'about note-2',
      creationTime: DateTime.now(),
      updatedTime: DateTime.now()),
  model(
      id: 3,
      title: 'note 3',
      content: 'about note-3',
      creationTime: DateTime.now(),
      updatedTime: DateTime.now()),
];
