import 'package:flutter/foundation.dart';
import 'package:todo/model/todocollection.dart';

class TodoRepository extends ChangeNotifier {
  final List<TodoCollection> _todoCollectionList;
  int totalTasks = 0;
  int isDoneCount = 0;

  TodoRepository({@required List<TodoCollection> todoCollectionList})
      : _todoCollectionList = todoCollectionList {
    todoCollectionList.forEach((element) {
      totalTasks += element.totalTasks;
      isDoneCount += element.isDoneCount;
    });
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
    totalTasks = 0;
    isDoneCount = 0;
    todoCollectionList.forEach((element) {
      totalTasks += element.totalTasks;
      isDoneCount += element.isDoneCount;
    });
    notifyListeners();
  }

  List<TodoCollection> get todoCollectionList => _todoCollectionList;
}
