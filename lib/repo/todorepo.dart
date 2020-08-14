import 'package:flutter/foundation.dart';
import 'package:todo/model/todocollection.dart';

class TodoRepository with ChangeNotifier {
  List<TodoCollection> _todoCollectionList;
  static final List<TodoCollection> _defaultCollectionList = [
    TodoCollection(title: 'Home')
  ];

  int _totalTasks = 0;
  int _isDoneCount = 0;

  TodoRepository({@required List<TodoCollection> todoCollectionList})
      : _todoCollectionList = todoCollectionList {
    todoCollectionList.forEach((element) {
      _totalTasks += element.totalTasks;
      _isDoneCount += element.isDoneCount;
    });
  }

  TodoRepository.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      _todoCollectionList = [TodoCollection(title: 'Home')];
    } else {
      _isDoneCount = json["isDoneCount"];
      _totalTasks = json['totalTasks'];
      var tempTodo = json['todoCollectionList'] as List;
      _todoCollectionList =
          tempTodo.map((i) => TodoCollection.fromJson(i)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempTodoCollectionList =
        todoCollectionList.map((i) => i.toJson()).toList();
    return {
      "todoCollectionList": tempTodoCollectionList,
      "isDoneCount": isDoneCount,
      "totalTasks": totalTasks,
    };
  }

  void addCollection(TodoCollection todoCollection) {
    _todoCollectionList.add(todoCollection);
    notifyListeners();
  }

  void deleteCollection(int index) {
    _todoCollectionList.removeAt(index);

    notifyListeners();
  }

  void updateCount() {
    _totalTasks = 0;
    _isDoneCount = 0;
    todoCollectionList.forEach((element) {
      _totalTasks += element.totalTasks;
      _isDoneCount += element.isDoneCount;
    });
    notifyListeners();
  }

  int get totalTasks => _totalTasks;
  int get isDoneCount => _isDoneCount;

  List<TodoCollection> get todoCollectionList => _todoCollectionList;
  static List<TodoCollection> get defaultCollectionList =>
      _defaultCollectionList;
}
