import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _fullName;
  String _displayName;

  User({@required String fullName})
      : _fullName = fullName ?? '',
        _displayName = (fullName ?? '').split(' ')[0];

  User.fromJson(Map<String, dynamic> json) {
    _fullName = json['fullName'];
    _displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() => {
        "fullName": _fullName,
        "displayName": _displayName,
      };

  String get fullName => _fullName;

  String get displayName => _displayName;

  void setName(String fullName) {
    print('set');
    _fullName = fullName;
    _displayName = _fullName.split(' ')[0];
    notifyListeners();
  }
}
