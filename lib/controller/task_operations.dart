import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/board.dart';
import 'package:todo_app/model/todo.dart';

void addItem(SharedPreferences sharedPreferences, Task item, List<Task> list) {
  // Insert an item into the top of our list, on index zero
  list.add(item);
  saveData(sharedPreferences, list);
}

void editItem(Task item, String title, SharedPreferences sharedPreferences,
    List<Task> list) {
  item.title = title;
  saveData(sharedPreferences, list);
}

void removeItem(
    Task item, SharedPreferences sharedPreferences, List<Task> list) {
  list.remove(item);
  saveData(sharedPreferences, list);
}

List<Task> loadData(SharedPreferences sharedPreferences, List<Task> list) {
  List<String>? listString = sharedPreferences.getStringList('list');
  if (listString != null) {
    list = listString.map((item) => Task.fromMap(json.decode(item))).toList();
  }
  return (list);
}

void saveData(SharedPreferences sharedPreferences, List<Task> list) {
  List<String> stringList =
      list.map((item) => json.encode(item.toMap())).toList();
  sharedPreferences.setStringList('list', stringList);
  print(list[0].title);
}
