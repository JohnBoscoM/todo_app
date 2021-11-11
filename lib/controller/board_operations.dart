import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/board.dart';

void addItem(
    SharedPreferences sharedPreferences, dynamic item, List<dynamic> list) {
  // Insert an item into the top of our list, on index zero
  list.add(item);
  saveData(sharedPreferences, list);
}

void editItem(dynamic item, String title, SharedPreferences sharedPreferences,
    List<dynamic> list) {
  item.title = title;
  saveData(sharedPreferences, list);
}

void removeItem(
    dynamic item, SharedPreferences sharedPreferences, List<dynamic> list) {
  list.remove(item);
  saveData(sharedPreferences, list);
}

void loadData(SharedPreferences sharedPreferences, List<dynamic> list) {
  List<String>? listString = sharedPreferences.getStringList('list');
  if (listString != null) {
    list = listString.map((item) => Board.fromMap(json.decode(item))).toList();
  }
}

void saveData(SharedPreferences sharedPreferences, List<dynamic> list) {
  List<String> stringList =
      list.map((item) => json.encode(item.toMap())).toList();
  sharedPreferences.setStringList('list', stringList);
}
