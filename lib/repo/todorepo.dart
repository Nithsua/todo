import 'package:todo/model/todo.dart';
import 'package:todo/model/todocollection.dart';

class TodoRepo {
  List<TodoCollection> todoCollectionList = [
    TodoCollection(title: 'Home', todo: [
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
      Todo(title: 'Hai'),
    ]),
    TodoCollection(title: 'Work', todo: [Todo(title: 'Hai')]),
  ];
}
