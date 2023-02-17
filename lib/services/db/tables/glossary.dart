import 'package:glossary/services/db/exceptions.dart';
import 'package:glossary/services/db/tables/lang.dart';
import 'package:glossary/services/dto/glossary.dart';

class TableGlossary {
  static const String name = 'langs_glossary';
  static const String col0 = 'lang1';
  static const String col1 = 'lang2';
  static const String col2 = 'last_view';
  static const String col3 = 'lang_order';

  static List<String> getTableColumns() {
    return [col0, col1, col2, col3];
  }

  static String getCreateTable() {
    return 'CREATE TABLE IF NOT EXISTS $name ('
        '   $col0 TEXT NOT NULL,'
        '   $col1 TEXT NOT NULL,'
        '   $col2 INTEGER,'
        '   $col3 INTEGER NOT NULL,'
        '   PRIMARY KEY($col0, $col1)'
        '   FOREIGN KEY($col0, $col1) REFERENCES ${TableLang.name}('
        '     ${TableLang.col0}, ${TableLang.col0}'
        '   )'
        ')';
  }

  static String queryAll() {
    return '''SELECT * FROM $name ORDER BY $col2 ASC''';
  }

  static String insertGlossary() {
    return 'INSERT INTO $name ($col0, $col1, $col2, $col3) VALUES (?, ?, ?, ?)';
  }

  static DtoGlossary toDTO(Map<String, dynamic> row) {
    DtoGlossary result;
    if (!row.containsKey(col0)) {
      throw DTOConvException(DtoGlossary.name, col0);
    }
    if (!row.containsKey(col1)) {
      throw DTOConvException(DtoGlossary.name, col1);
    }
    if (!row.containsKey(col2)) {
      throw DTOConvException(DtoGlossary.name, col2);
    }
    if (!row.containsKey(col3)) {
      throw DTOConvException(DtoGlossary.name, col3);
    }
    result = DtoGlossary(
        lang1: row[col0],
        lang2: row[col1],
        lastView: row[col2],
        langOrder: row[col3]);
    return result;
  }
}
