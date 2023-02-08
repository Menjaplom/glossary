import 'package:glossary/services/db/tables/word.dart';

class TableWordTranslation {
  static const String name = 'word_translations';
  static const String col0 = 'lang1';
  static const String col1 = 'lang2';
  static const String col2 = 'tag1';
  static const String col3 = 'tag2';
  static const String col4 = 'word1';
  static const String col5 = 'word2';

  static String getCreateTable() {
    return '''CREATE TABLE IF NOT EXISTS $name ( 
                $col0 TEXT NOT NULL,
                $col1 TEXT NOT NULL, 
                $col2 TEXT NOT NULL,
                $col3 TEXT NOT NULL,
                $col4 TEXT NOT NULL, 
                $col5 TEXT NOT NULL, 
                PRIMARY KEY($col0, $col1, $col2, $col3, $col4, $col5),
                FOREIGN KEY($col0, $col1, $col2, $col3, $col4, $col5) REFERENCES ${TableWord.name}(
                  ${TableWord.col0}, ${TableWord.col0}, ${TableWord.col1}, 
                  ${TableWord.col1}, ${TableWord.col2}, ${TableWord.col2}
                )
              )''';
  }
}
