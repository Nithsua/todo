import 'package:flutter/material.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TodoRepo _todoRepo = TodoRepo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.grey[400],
          ),
        ),
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: HomePage(
        todoCollectionList: _todoRepo.todoCollectionList,
      ),
    );
  }
}
