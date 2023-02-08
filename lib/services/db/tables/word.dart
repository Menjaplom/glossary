import 'package:glossary/services/db/tables/tag.dart';

class TableWord {
  static const String name = 'words';
  static const String col0 = 'lang';
  static const String col1 = 'tag';
  static const String col2 = 'word';
  static const String col3 = 'description';

  static String getCreateTable() {
    return '''CREATE TABLE IF NOT EXISTS $name ( 
                $col0 TEXT NOT NULL,
                $col1 TEXT NOT NULL,
                $col2 TEXT NOT NULL, 
                $col3 TEXT,
                PRIMARY KEY($col0, $col1, $col2),
                FOREIGN KEY($col0, $col1) REFERENCES ${TableTag.name}(
                  ${TableTag.col0}, ${TableTag.col1}
                )
              )''';
  }
}
