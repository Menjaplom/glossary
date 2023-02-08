import 'package:sqflite/sqflite.dart';
import 'package:glossary/services/db/db_stub.dart'
    if (dart.library.html) 'package:glossary/services/db/db_web.dart'
    if (dart.library.io) 'package:glossary/services/db/db_desktop.dart';
import 'package:glossary/services/db/tables/tables.dart';
import 'package:glossary/services/dto/dto.dart';

class GlossaryDB {
  // Creating singleton instance
  static final GlossaryDB instance = GlossaryDB._privateConstructor();
  GlossaryDB._privateConstructor();

  static Database? _database;
  static const _databaseVersion = 1;

  Future<void> init() async {
    if (_database == null) _database = await initDatabase('glossary.db');
    await _createTables(_database!, _databaseVersion);
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute(TableLang.getCreateTable());
    await db.execute(TableGlossary.getCreateTable());
    await db.execute(TableTag.getCreateTable());
    await db.execute(TableTagTranslation.getCreateTable());
    await db.execute(TableWord.getCreateTable());
    await db.execute(TableWordTranslation.getCreateTable());
  }

  /*Future<List<LangsGlossary>> getLangsGlossary() {
    List<Map<String, dynamic>> maps = _database!.query('langs_glossary',
        columns: LangsGlossary.getTableColumns(),
        orderBy: 'last_view') as List<Map<String, dynamic>>;
  }*/
}
