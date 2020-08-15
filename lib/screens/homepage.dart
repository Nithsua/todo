import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/user.dart';
import 'package:todo/screens/settings.dart';
import 'package:todo/services/init.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/widgets/newtodocollectiondialog.dart';
import 'package:todo/widgets/todocollectioncard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: FutureBuilder(
        future: init.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            TodoRepository todoRepository = snapshot.data['todoRepository'];
            User user = snapshot.data['user'];
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: todoRepository),
                ChangeNotifierProvider.value(value: user),
              ],
              builder: (context, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer<User>(
                                builder: (context, user, _) => Text(
                                  'Hello, ${user.displayName}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                  ),
                                ),
                              ),
                              Tooltip(
                                message: 'Settings',
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider.value(
                                                    value: user,
                                                    builder: (context, _) =>
                                                        SettingsPage())));
                                  },
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.settings,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Consumer<TodoRepository>(
                          builder: (context, todoRepository, _) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35.0, vertical: 20.0),
                            child: Text(
                              'You have ${todoRepository.totalTasks - todoRepository.isDoneCount} tasks to do today',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your Collections',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Tooltip(
                              message: 'New Collection',
                              child: IconButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ChangeNotifierProvider.value(
                                            value: todoRepository,
                                            builder: (context, _) =>
                                                NewTodoCollectionDialog(
                                                  dialogTitle: 'Collection',
                                                ))),
                                icon: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 35.0,
                          ),
                          child: Container(
                            height: 420,
                            child: Consumer<TodoRepository>(
                              builder: (context, value, _) => PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    todoRepository.todoCollectionList.length,
                                itemBuilder: (context, index) => MultiProvider(
                                  providers: [
                                    ChangeNotifierProvider.value(
                                        value: todoRepository
                                            .todoCollectionList[index]),
                                    ChangeNotifierProvider.value(
                                        value: todoRepository)
                                  ],
                                  builder: (context, _) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: TodoCollectionCard(
                                        collectionIndex: index),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
