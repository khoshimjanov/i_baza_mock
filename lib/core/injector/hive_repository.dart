import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepository {
  static HiveRepository? _storageHive;
  static HiveRepository? _storagePicture;
  static Box? _box;
  static Box? _pictureBox;

  static Future<HiveRepository> getInctance() async {
    if(_storageHive == null) {
      final secureStorage = HiveRepository._();
      await secureStorage._initHive();
      _storageHive = secureStorage;
    }
    return _storageHive!;
  }

  HiveRepository._();

  Future<void> _initHive() async {
    const boxName = 'jahongir';
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _box = await Hive.openBox<dynamic>(boxName);
  }
  static bool getAuthStatusHive() {
    return _box?.get('isAuthenticatedHive') ?? false;
  }
  static Future<void> setAuthStatusHive(bool value) async {
     return await _box?.put('isAuthenticatedHive', value);
  }



  static Future<HiveRepository> getInctancePicture() async {
    if(_storagePicture == null) {
      final secureStorage = HiveRepository._();
      await secureStorage._initPictureHive();
      _storagePicture = secureStorage;
    }
    return _storagePicture!;
  }

  Future<void> _initPictureHive() async {
    const boxName = 'pictureBox';
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _pictureBox = await Hive.openBox<String>(boxName);
  }
  static List<String> getPicturePaths() {
    return _pictureBox?.get('picturePaths', defaultValue: []) ?? [];
  }

  static Future<void> addPicturePath(String path) async {
    List<String> paths = getPicturePaths();
    paths.add(path);
    await _pictureBox?.put('picturePaths', paths);
  }

  static Future<void> clearPicturePaths() async {
    await _pictureBox?.delete('picturePaths');
  }
}