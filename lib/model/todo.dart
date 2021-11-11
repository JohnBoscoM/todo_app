import 'package:hive/hive.dart';

import 'board.dart';

class Task {
  String? id;
  String description;
  int hours;
  bool completed;
  Board board;

  Task(
      {required this.description,
      required this.hours,
      required this.completed,
      required this.board});

  Task.fromMap(Map map)
      : id = map['id'],
        description = map['description'],
        hours = map['hours'],
        completed = map['completed'],
        board = map['Board'];
}
