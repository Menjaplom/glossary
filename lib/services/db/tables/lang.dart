import 'package:glossary/services/dto/language.dart';

import '../exceptions.dart';

class TableLang {
  static const String name = 'languages';
  static const String col0 = 'lang';

  static List<String> getTableColumns() {
    return [col0];
  }

  static String getCreateTable() {
    return '''CREATE TABLE IF NOT EXISTS $name ( 
                $col0 TEXT NOT NULL,
                PRIMARY KEY($col0)
              )''';
  }

  static String queryAll() {
    return '''SELECT * FROM $name ORDER BY $col0 ASC''';
  }

  static String insert() {
    return 'INSERT INTO $name ($col0) VALUES (?)';
  }

  static DtoLang toDTO(Map<String, dynamic> row) {
    DtoLang result;
    if (!row.containsKey(col0)) throw DTOConvException(DtoLang.name, col0);
    result = DtoLang(lang: row[col0]);
    return result;
  }
}
