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
}
