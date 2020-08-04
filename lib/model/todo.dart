import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  String _title;
  bool _isDone;

  Todo({@required String title})
      : assert(title != null),
        _title = title,
        _isDone = false;

  String get title => _title;

  bool get isDone => _isDone;

  set changeTitle(String title) {
    if (title == _title) return;
    _title = title;
    notifyListeners();
  }

  set changeIsDone(bool value) {
    if (_isDone == value) return;
    _isDone = value;
    notifyListeners();
  }
}
