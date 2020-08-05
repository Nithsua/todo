import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/screens/newtodo.dart';
import 'package:todo/widgets/listtile.dart';
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
          floatingActionButton: FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(providers: [
                      ChangeNotifierProvider.value(value: todoCollection),
                      ChangeNotifierProvider.value(value: todoRepository),
                    ], child: AddTodoPage()),
                  ));
            },
            label: Text(
              'Add Item',
              style: TextStyle(
                color: Colors.white,
                // fontSize: 30.0,
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
