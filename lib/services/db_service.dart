import 'package:glossary/services/db/exceptions.dart';
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

  /* GLOSSARY OPERATIONS */

  Future<List<DtoGlossary>> getGlossaries() async {
    List<Map<String, dynamic>> rows =
        await _database!.rawQuery(TableGlossary.queryAll());
    List<DtoGlossary> result = rows.map((r) => TableGlossary.toDTO(r)).toList();
    return result;
  }

  void insertGlossary(DtoGlossary dto) async {
    int id = 0;
    try {
      id = await _database!.rawInsert(TableGlossary.insertGlossary(),
          [dto.lang1, dto.lang2, dto.lastView, dto.langOrder]);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError())
        throw InsertionException(TableGlossary.name, dto.toString(),
            'This Glossary already exists. Complete trace: ${e.toString()}');
      else if (e.isNotNullConstraintError()) {
        throw InsertionException(TableGlossary.name, dto.toString(),
            'Some field should not be NULL. Complete trace: ${e.toString()}');
      } else {
        throw UnknownException(
            TableGlossary.name, dto.toString(), e.toString());
      }
    } catch (e) {
      throw UnknownException(TableGlossary.name, dto.toString(), e.toString());
    }
    if (id == 0) {
      throw InsertionException(
          TableGlossary.name, dto.toString(), 'Unknown. Row ID returned 0.');
    }
  }
}
