import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/model/user.dart';
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
    TodoRepository todoRepo = TodoRepository(
        todoCollectionList: TodoRepository.defaultCollectionList);
    json = jsonEncode(todoRepo.toJson());
    print(json);
    _pref.setString('data', json);
    return TodoRepository(
        todoCollectionList: TodoRepository.defaultCollectionList);
  }

  Future<User> getUserData() async {
    _pref = await SharedPreferences.getInstance();
    String json;
    if (_pref.containsKey('user')) {
      json = _pref.getString('user');
      print("\"" + json + "\"");
      return User.fromJson(jsonDecode(json));
    }
    User user = User(fullName: null);
    json = jsonEncode(user);
    _pref.setString('user', json);
    return User(fullName: null);
  }

  updateUserDate(User user) async {
    _pref = await SharedPreferences.getInstance();
    String json = jsonEncode(user.toJson());
    _pref.setString('data', json);
  }
}

LocalStore localStore = LocalStore();
