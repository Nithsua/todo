import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/screens/todopage.dart';
import 'package:todo/widgets/progressbar.dart';

class HomePage extends StatelessWidget {
  final List<TodoCollection> _todoCollectionList;

  HomePage({@required List<TodoCollection> todoCollectionList})
      : assert(todoCollectionList != null),
        _todoCollectionList = todoCollectionList;

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
      body: Column(
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
                    'You have 3 taks to do today',
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
                itemCount: _todoCollectionList.length,
                itemBuilder: (context, index) => TodoCollectionCardBuilder(
                  todoCollection: _todoCollectionList[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TodoCollectionCardBuilder extends StatelessWidget {
  final TodoCollection _todoCollection;

  TodoCollectionCardBuilder({@required TodoCollection todoCollection})
      : assert(todoCollection != null),
        _todoCollection = todoCollection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoPage(
                  todoCollection: _todoCollection,
                ),
              ),
            );
          },
          child: Hero(
            tag: _todoCollection.title,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ProgressBar(todoCollection: _todoCollection),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
