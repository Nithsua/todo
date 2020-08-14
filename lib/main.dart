import 'package:flutter/material.dart';
import 'package:todo/screens/homepage.dart';

// List<TodoCollection> todoCollectionList = [
//   TodoCollection(
//     title: 'Home',
//     todo: [
//       Todo(title: 'Hai'),
//       Todo(title: 'Hai'),
//       Todo(title: 'Hai'),
//     ],
//   ),
//   TodoCollection(
//     title: 'Work',
//     todo: [
//       Todo(title: 'Hai'),
//       Todo(title: 'Hai'),
//       Todo(title: 'Hai'),
//     ],
//   ),
// ];

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // TodoRepository todoRepository =
  //     TodoRepository(todoCollectionList: todoCollectionList);
  // localStore.updateLocalData(todoRepository);
  // runApp(MaterialApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: HomePage(),
    );
  }
}
