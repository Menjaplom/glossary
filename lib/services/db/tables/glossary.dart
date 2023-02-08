import 'package:glossary/services/db/tables/lang.dart';

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
    return '''CREATE TABLE IF NOT EXISTS $name ( 
                $col0 TEXT NOT NULL,
                $col1 TEXT NOT NULL,
                $col2 INTEGER,
                $col3 INTEGER NOT NULL,
                PRIMARY KEY($col0, $col1)
                FOREIGN KEY($col0, $col1) REFERENCES ${TableLang.name}(${TableLang.col0}, ${TableLang.col0})
              )''';
  }
}
