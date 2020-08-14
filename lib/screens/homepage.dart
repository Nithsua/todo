import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/user.dart';
import 'package:todo/services/init.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/widgets/todocollectioncard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipOval(
                            child: CircleAvatar(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Consumer<User>(
                            builder: (context, user, _) => Text(
                              '${user.displayName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                        Consumer<TodoRepository>(
                          builder: (context, todoRepository, _) => Padding(
                            padding: const EdgeInsets.all(20.0),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Container(
                      height: 380,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: todoRepository.todoCollectionList.length,
                        itemBuilder: (context, index) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider.value(
                                value:
                                    todoRepository.todoCollectionList[index]),
                            ChangeNotifierProvider.value(value: todoRepository)
                          ],
                          builder: (context, _) => TodoCollectionCard(),
                        ),
                      ),
                    ),
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
