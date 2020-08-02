import 'package:flutter/foundation.dart';

class Todo {
  String _title;
  bool _isDone;

  Todo({@required String title})
      : assert(title != null),
        _title = title,
        _isDone = false;

  String get title => _title;

  bool get isDone => _isDone;

  set changeTitle(String title) => _title;

  set changeIsDone(bool value) => _isDone;
}
