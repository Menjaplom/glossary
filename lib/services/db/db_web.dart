import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<Database> initDatabase(String filePath) async {
  var databaseFactory = databaseFactoryFfiWeb;
  final dbPath = join('.', filePath);
  Database db = await databaseFactory.openDatabase(dbPath);
  return db;
}
