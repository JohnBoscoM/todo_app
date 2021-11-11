import 'package:hive/hive.dart';
import 'package:todo_app/model/todo.dart';

class Board {
  String title;
  List<Task>? tasks;

  Board({required this.title, this.tasks});

  Board.fromMap(Map map)
      : title = map['title'],
        tasks = map['tasks'];

  Map toMap() {
    return {'title': title, 'tasks': tasks};
  }
}
