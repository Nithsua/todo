import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/user.dart';
import 'package:todo/widgets/changenamedialog.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Provider.of<User>(context, listen: false),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Consumer<User>(
          builder: (context, user, _) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: ListTile(
                        title: Text(
                          'Hello, ${user.displayName}',
                          style: TextStyle(
                            fontSize: 30,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            title: Text(
                              'Change Name',
                              style: TextStyle(
                                  // color: Colors.white,
                                  ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ChangeNotifierProvider.value(
                                    value: user,
                                    builder: (context, _) => ChangeNameDialog(
                                      dialogTitle: 'Name',
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
