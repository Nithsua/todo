import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/screens/todopage.dart';
import 'package:todo/widgets/progressbar.dart';

class TodoCollectionCard extends StatelessWidget {
  final int _collectionIndex;

  TodoCollectionCard({@required int collectionIndex})
      : assert(collectionIndex != null),
        _collectionIndex = collectionIndex;

  @override
  Widget build(BuildContext context) {
    var todoRepository = Provider.of<TodoRepository>(context);
    return Consumer<TodoCollection>(
      builder: (context, todoCollection, child) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: InkWell(
            borderRadius: BorderRadius.circular(20.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider.value(value: todoCollection),
                      ChangeNotifierProvider.value(value: todoRepository),
                    ],
                    builder: (context, _) => TodoPage(
                      todoCollection: todoCollection,
                      collectionIndex: _collectionIndex,
                    ),
                  ),
                ),
              );
            },
            child: Hero(
              tag: todoCollection.title,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
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
                              todoCollection.title,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${todoCollection.totalTasks - todoCollection.isDoneCount} Tasks left',
                            style: TextStyle(
                              color: Colors.grey[600],
                              // fontSize: 30.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ProgressBar(
                              totalTask: todoCollection.totalTasks,
                              isDoneCount: todoCollection.isDoneCount),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
