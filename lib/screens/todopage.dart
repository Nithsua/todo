import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/screens/newtodo.dart';
import 'package:todo/services/localstore.dart';
import 'package:todo/widgets/listtile.dart';
import 'package:todo/widgets/progressbar.dart';

class TodoPage extends StatelessWidget {
  final TodoCollection _todoCollection;
  final int _collectionIndex;

  TodoPage(
      {@required TodoCollection todoCollection, @required int collectionIndex})
      : assert(todoCollection != null),
        _todoCollection = todoCollection,
        _collectionIndex = collectionIndex;

  @override
  Widget build(BuildContext context) {
    var todoRepository = Provider.of<TodoRepository>(context);

    return Consumer<TodoCollection>(
      builder: (context, todoCollection, _) => Hero(
        tag: _todoCollection.title,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 35.0, right: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${todoCollection.totalTasks} Tasks',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _todoCollection.title,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 30.0,
                          ),
                        ),
                        Tooltip(
                          message: 'Delete Collection',
                          child: IconButton(
                            padding: EdgeInsets.only(left: 0.0),
                            onPressed: () {
                              todoRepository.deleteCollection(_collectionIndex);
                              localStore.updateLocalData(todoRepository);
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 35.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
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
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
