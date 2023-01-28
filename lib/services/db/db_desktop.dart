import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart';

Future<Database> initDatabase(String filePath) async {
  Database db;
  String path;
  if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.windows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    path = join('.', filePath);
  } else {
    String dbPath = await getDatabasesPath();
    path = join(dbPath, filePath);
  }
  db = await databaseFactory.openDatabase(path);
  return db;
}
