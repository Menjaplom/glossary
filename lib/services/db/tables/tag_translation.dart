import 'package:glossary/services/db/tables/tag.dart';

class TableTagTranslation {
  static const String name = 'tag_translations';
  static const String col0 = 'lang1';
  static const String col1 = 'lang2';
  static const String col2 = 'tag1';
  static const String col3 = 'tag2';

  static List<String> getTableColumns() {
    return [col0, col1, col2, col3];
  }

  static String getCreateTable() {
    return '''CREATE TABLE IF NOT EXISTS $name (
                $col0 TEXT NOT NULL,
                $col1 TEXT NOT NULL, 
                $col2 TEXT NOT NULL,
                $col3 TEXT NOT NULL,
                PRIMARY KEY($col0, $col1, $col2, $col3),
                FOREIGN KEY($col0, $col1, $col2, $col3) REFERENCES ${TableTag.name}(
                  ${TableTag.col0}, ${TableTag.col0}, ${TableTag.col1}, ${TableTag.col1}
                )
              )''';
  }
}
