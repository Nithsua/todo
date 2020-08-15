import 'package:flutter/material.dart';
import 'package:todo/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
