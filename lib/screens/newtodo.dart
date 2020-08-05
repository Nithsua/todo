import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addTodo(String title) {
      print(title);
      Provider.of<TodoCollection>(context, listen: false).addTodo(title);
      Provider.of<TodoRepository>(context, listen: false).updateCount();
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: addTodo,
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Enter the title',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: Colors.grey[600],
                // fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addTodo(_textEditingController.text);
        },
        icon: Icon(Icons.add),
        label: Text('Add Item'),
      ),
    );
  }
}
