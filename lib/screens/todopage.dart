import 'package:flutter/material.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/widgets/progressbar.dart';

class TodoPage extends StatefulWidget {
  final TodoCollection _todoCollection;

  TodoPage({@required TodoCollection todoCollection})
      : assert(todoCollection != null),
        _todoCollection = todoCollection;

  @override
  _TodoPageState createState() =>
      _TodoPageState(todoCollection: _todoCollection);
}

class _TodoPageState extends State<TodoPage> {
  final TodoCollection _todoCollection;

  _TodoPageState({@required TodoCollection todoCollection})
      : assert(todoCollection != null),
        _todoCollection = todoCollection;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget._todoCollection.title,
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
                    '12 Tasks',
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
                    child: ProgressBar(todoCollection: _todoCollection),
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
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  title: Text(_todoCollection.getTodo(index).title),
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _todoCollection.getTodo(index).isDone,
                      onChanged: (bool value) => setState(() =>
                          _todoCollection.updateTodo(index, value: value)),
                    ),
                  ),
                  trailing: Visibility(
                    visible: _todoCollection.getTodo(index).isDone,
                    child: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: RaisedButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            color: _todoCollection.colorSwatch,
            onPressed: () {},
            shape: CircleBorder(),
          ),
        ),
      ),
    );
  }
}
