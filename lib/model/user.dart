import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _fullName;
  String _displayName;

  String get fullName => _fullName;

  String get displayName => _displayName;

  set setFullName(String fullName) => _fullName = fullName;

  set setDisplayName(String displayName) => _displayName = displayName;
}
