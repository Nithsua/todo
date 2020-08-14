import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/repo/todorepo.dart';

class LocalStore {
  SharedPreferences _pref;

  updateLocalData(TodoRepository todoRepository) async {
    _pref = await SharedPreferences.getInstance();
    String json = jsonEncode(todoRepository.toJson());
    print(json);
    _pref.setString('data', json);
  }

  Future<TodoRepository> getLocalData() async {
    _pref = await SharedPreferences.getInstance();
    String json;
    if (_pref.containsKey('data')) {
      json = _pref.getString('data');
      print(json);
      return TodoRepository.fromJson(jsonDecode(json));
    }
    _pref.setString('data', '');
    return null;
  }
}

LocalStore localStore = LocalStore();
