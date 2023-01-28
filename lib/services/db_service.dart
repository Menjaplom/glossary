import 'package:sqflite/sqflite.dart';
import 'package:glossary/services/db/db_stub.dart'
    if (dart.library.html) 'package:glossary/services/db/db_web.dart'
    if (dart.library.io) 'package:glossary/services/db/db_desktop.dart';

class GlossaryDB {
  // Creating singleton instance
  static final GlossaryDB instance = GlossaryDB._privateConstructor();
  GlossaryDB._privateConstructor();

  static Database? _database;
  static const _databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase('glossary.db');
    return _database!;
  }

  Future _create(Database db, int version) async {
    print('first table created');
    await db.execute('''CREATE TABLE IF NOT EXISTS langs ( 
                          lang TEXT NOT NULL,
                          PRIMARY KEY(lang)
                        )''');
    print('first table created');
    await db.execute('''CREATE TABLE IF NOT EXISTS langs_glossary ( 
                          lang1 TEXT NOT NULL,
                          lang2 TEXT NOT NULL,
                          last_open INTEGER,
                          lang_order INTEGER NOT NULL,
                          PRIMARY KEY(lang1, lang2)
                          FOREIGN KEY(lang1, lang2) REFERENCES langs(lang, lang)
                        )''');
    await db.execute('''CREATE TABLE IF NOT EXISTS tags ( 
                          lang TEXT NOT NULL, 
                          tag TEXT NOT NULL,
                          PRIMARY KEY(lang, tag)
                          FOREIGN KEY(lang) REFERENCES langs(lang)
                        )''');
    await db.execute('''CREATE TABLE IF NOT EXISTS tag_translations ( 
                          lang1 TEXT NOT NULL,
                          lang2 TEXT NOT NULL, 
                          tag1 TEXT NOT NULL,
                          tag2 TEXT NOT NULL,
                          PRIMARY KEY(lang1, lang2, tag1, tag2),
                          FOREIGN KEY(lang1, lang2, tag1, tag2) REFERENCES tags(lang, lang, tag, tag)
                        )''');
    await db.execute('''CREATE TABLE IF NOT EXISTS words ( 
                          lang TEXT NOT NULL,
                          tag TEXT NOT NULL,
                          word TEXT NOT NULL, 
                          description TEXT,
                          PRIMARY KEY(lang, tag, word),
                          FOREIGN KEY(lang, tag) REFERENCES tags(lang, tag)
                        )''');
    await db.execute('''CREATE TABLE IF NOT EXISTS word_translations ( 
                          lang1 TEXT NOT NULL,
                          lang2 TEXT NOT NULL, 
                          tag1 TEXT NOT NULL,
                          tag2 TEXT NOT NULL,
                          word1 TEXT NOT NULL, 
                          word2 TEXT NOT NULL, 
                          PRIMARY KEY(lang1, lang2, tag1, tag2, word1, word2),
                          FOREIGN KEY(lang1, lang2, tag1, tag2, word1, word2) REFERENCES words(lang, lang, tag, tag, word, word)
                        )''');
  }
}
