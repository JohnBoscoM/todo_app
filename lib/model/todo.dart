import 'package:hive/hive.dart';

import 'board.dart';

class Task {
  String title;
  int hours;
  bool isCompleted;

  Task({
    required this.title,
    this.hours = 0,
    required this.isCompleted,
  });

  Task.fromMap(Map map)
      : title = map['title'],
        hours = map['hours'],
        isCompleted = map['isCompleted'];

  Map toMap() {
    return {'title': title, 'hours': hours, 'isCompleted': isCompleted};
  }
}
