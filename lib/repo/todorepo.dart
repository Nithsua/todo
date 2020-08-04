import 'package:flutter/foundation.dart';
import 'package:todo/model/todocollection.dart';

class TodoRepository extends ChangeNotifier {
  final List<TodoCollection> _todoCollectionList;

  TodoRepository({@required List<TodoCollection> todoCollectionList})
      : _todoCollectionList = todoCollectionList;

  void addCollection(TodoCollection todoCollection) {
    _todoCollectionList.add(todoCollection);
    notifyListeners();
  }

  void deleteCollection(int index) {
    _todoCollectionList.removeAt(index);
  }
}
