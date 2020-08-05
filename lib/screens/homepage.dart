import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: Consumer<TodoRepository>(
        builder: (context, todoRepository, _) {
          return Column(
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
                      child: Text(
                        'Hello, Nivas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'You have ${todoRepository.totalTasks - todoRepository.isDoneCount} tasks to do today',
                        style: TextStyle(
                          color: Colors.white,
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
                            value: todoRepository.todoCollectionList[index]),
                        ChangeNotifierProvider.value(value: todoRepository)
                      ],
                      builder: (context, _) => TodoCollectionCard(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
