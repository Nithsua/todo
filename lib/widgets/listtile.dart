import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/localstore/localstore.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';

class CustomListTile extends StatelessWidget {
  final int _index;

  CustomListTile({int index}) : _index = index;

  @override
  Widget build(BuildContext context) {
    return Consumer<Todo>(
      builder: (context, todo, _) => ListTile(
        contentPadding: const EdgeInsets.all(0.0),
        title: Text(todo.title),
        leading: SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: todo.isDone,
            onChanged: (bool value) {
              todo.changeIsDone = value;
              Provider.of<TodoCollection>(context, listen: false)
                  .updateDoneCount();
              TodoRepository todoRepository =
                  Provider.of<TodoRepository>(context, listen: false);
              todoRepository.updateCount();
              localStore.updateLocalData(todoRepository);
            },
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            Provider.of<TodoCollection>(context, listen: false)
                .deleteTodo(_index);
            TodoRepository todoRepository =
                Provider.of<TodoRepository>(context, listen: false);
            todoRepository.updateCount();
            localStore.updateLocalData(todoRepository);
          },
        ),
      ),
    );
  }
}
