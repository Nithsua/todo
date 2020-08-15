import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todocollection.dart';
import 'package:todo/repo/todorepo.dart';
import 'package:todo/services/localstore.dart';

class NewTodoCollectionDialog extends StatelessWidget {
  final String _dialogTitle;

  NewTodoCollectionDialog({String dialogTitle}) : _dialogTitle = dialogTitle;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New $_dialogTitle',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter $_dialogTitle Name',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () => Navigator.pop(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    disabledColor: Colors.grey[400],
                    onPressed:
                        // (_textEditingController.text == '' ||
                        //         _textEditingController.text == null ||
                        //         _textEditingController.text == ' ')
                        //     ? () => null
                        //     :
                        () {
                      TodoRepository todoRepo =
                          Provider.of<TodoRepository>(context, listen: false);
                      print(_textEditingController.text);
                      todoRepo.addCollection(
                          TodoCollection(title: _textEditingController.text));
                      localStore.updateLocalData(todoRepo);
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.blue,
                    child: Text('Ok'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
