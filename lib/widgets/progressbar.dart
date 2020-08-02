import 'package:flutter/material.dart';
import 'package:todo/model/todocollection.dart';

class ProgressBar extends StatefulWidget {
  final TodoCollection todoCollection;

  ProgressBar({@required this.todoCollection});

  @override
  _ProgressBarState createState() =>
      _ProgressBarState(todoCollection: todoCollection);
}

class _ProgressBarState extends State<ProgressBar> {
  final TodoCollection todoCollection;
  double completion;

  _ProgressBarState({@required this.todoCollection});

  @override
  void initState() {
    super.initState();
    if (todoCollection.totalTasks == 0) {
      completion = 1.0;
    } else {
      completion = todoCollection.isDoneCount / todoCollection.totalTasks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 2,
            value: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            '${1 * 100}%',
          ),
        ),
      ],
    );
  }
}
