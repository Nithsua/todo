import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/widgets/progressbar.dart';

class TodoPage extends StatelessWidget {
  final TodoCollection _todoCollection;

  TodoPage({@required TodoCollection todoCollection})
      : assert(todoCollection != null),
        _todoCollection = todoCollection;

  @override
  Widget build(BuildContext context) {
    var todoRepository = Provider.of<TodoRepository>(context);

    return Consumer<TodoCollection>(
      builder: (context, todoCollection, _) => Hero(
        tag: _todoCollection.title,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${todoCollection.totalTasks} Tasks',
                      style: TextStyle(
                        color: Colors.grey[600],
                        // fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      _todoCollection.title,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 30.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: ProgressBar(
                          totalTask: todoCollection.totalTasks,
                          isDoneCount: todoCollection.isDoneCount),
                    ),
                    Text(
                      'Todo',
                      style: TextStyle(
                        color: Colors.grey[600],
                        // fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _todoCollection.totalTasks,
                  itemBuilder: (context, index) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider.value(value: _todoCollection),
                      ChangeNotifierProvider.value(
                          value: _todoCollection.todo.elementAt(index)),
                      ChangeNotifierProvider.value(value: todoRepository),
                    ],
                    builder: (context, _) => CustomListTile(
                      index: index,
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'Add Item',
                      style: TextStyle(
                        color: Colors.white,
                        // fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              color: _todoCollection.accentColor,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ),
        ),
      ),
    );
  }
}

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
              Provider.of<TodoRepository>(context, listen: false).updateCount();
            },
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            Provider.of<TodoCollection>(context, listen: false)
                .deleteTodo(_index);
            Provider.of<TodoRepository>(context, listen: false).updateCount();
          },
        ),
      ),
    );
  }
}
