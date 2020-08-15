import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/user.dart';
import 'package:todo/services/localstore.dart';

class ChangeNameDialog extends StatelessWidget {
  final String _dialogTitle;

  ChangeNameDialog({String dialogTitle}) : _dialogTitle = dialogTitle;

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
              'Change $_dialogTitle',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter $_dialogTitle',
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
                      User user = Provider.of<User>(context, listen: false);
                      print(_textEditingController.text);
                      user.setName(_textEditingController.text);
                      localStore.updateUserDate(user);
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
