import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double completed;

  ProgressBar({@required int totalTask, @required int isDoneCount})
      : completed = totalTask == 0 ? 1 : isDoneCount / totalTask;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 2,
            value: completed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            '${(completed * 100).floor()}%',
          ),
        ),
      ],
    );
  }
}
