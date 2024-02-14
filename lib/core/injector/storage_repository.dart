// class MySingleton {
//   static MySingleton ? _instance;
//
//   MySingleton._internal();
//   factory MySingleton(){
//     if (_instance == null) {
//       _instance = MySingleton._internal();
//     }
//     return _instance!;
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static StorageRepository? _storageUtil;
  static SharedPreferences? _preferences;
  static Future<StorageRepository> getInstance() async {
    if (_storageUtil == null) {
      final secureStorage = StorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageRepository._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool getAuthStatus() {
    return _preferences?.getBool('isAuthenticated') ?? false;
  }

  static Future<bool?> setAuthStatus(bool value) async {
    return await _preferences?.setBool('isAuthenticated', value);
  }
}

