import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class TodoCollection {
  String _title;
  List<Todo> _todo;
  int _isDoneCount = 0;
  int _totalTasks;
  ColorSwatch _colorSwatch = Colors.blue;

  TodoCollection({@required String title, List<Todo> todo})
      : assert(title != null),
        _title = title,
        _todo = todo ?? [],
        _totalTasks = todo.length {
    todo.forEach((element) {
      if (element.isDone == true) {
        ++_isDoneCount;
      }
    });
  }

  String get title => _title;

  int get isDoneCount => _isDoneCount;

  int get totalTasks => _totalTasks;

  ColorSwatch get colorSwatch => _colorSwatch;

  Todo getTodo(int index) => _todo[index];

  void updateTodo(int index, {String title, bool value}) {
    if (title == null) {
      _todo[index].changeIsDone = value;
    } else if (value == null) {
      _todo[index].changeTitle = title;
    }
  }
}
