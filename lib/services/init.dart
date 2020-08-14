import 'package:todo/services/localstore.dart';

class Init {
  Future<Map<String, dynamic>> initializeApp() async => {
        'todoRepository': await localStore.getLocalData(),
        'user': await localStore.getUserData(),
      };
}

Init init = Init();
