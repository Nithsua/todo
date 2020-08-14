import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  String _title;
  bool _isDone;
  String _description;

  Todo({@required String title, String description})
      : assert(title != null),
        _title = title,
        _description = description ?? '',
        _isDone = false;

  Map<String, dynamic> toJson() => {
        "title": title,
        "isDone": isDone,
        "description": description,
      };

  Todo.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _isDone = json['isDone'];
    _description = json['description'];
  }

  String get title => _title;

  bool get isDone => _isDone;

  String get description => _description;

  set changeTitle(String title) {
    if (title == _title) return;
    _title = title;
    notifyListeners();
  }

  set changeDescription(String description) {
    if (description == _description) return;
    _description = description;
    notifyListeners();
  }

  set changeIsDone(bool value) {
    if (_isDone == value) return;
    _isDone = value;
    notifyListeners();
  }
}
