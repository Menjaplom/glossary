import 'package:glossary/services/db/tables/lang.dart';

class TableTag {
  static const String name = 'tags';
  static const String col0 = 'lang';
  static const String col1 = 'tag';

  static List<String> getTableColumns() {
    return [col0, col1];
  }

  static String getCreateTable() {
    return '''CREATE TABLE IF NOT EXISTS $name ( 
              $col0 TEXT NOT NULL, 
              $col1 TEXT NOT NULL,
              PRIMARY KEY($col0, $col1)
              FOREIGN KEY($col0) REFERENCES ${TableLang.name}(${TableLang.col0})
            )''';
  }
}
