import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mianatra_alemana/src/models/vocabulary_model.dart';

class DBProvider {
    // Create a singleton
    DBProvider._();

    static final DBProvider db = DBProvider._();
    Database _database;

    Future<Database> get database async {
        if (_database != null) {
            return _database;
        }

        _database = await initDB();
        return _database;
    }

    initDB() async {
        // Get the location of our app directory. This is where files for our app,
        // and only our app, are stored. Files in this directory are deleted
        // when the app is deleted.
        Directory documentsDir = await getApplicationDocumentsDirectory();
        String path = join(documentsDir.path, 'app.db');

        return await openDatabase(path, version: 1, onOpen: (db) async {
        }, onCreate: (Database db, int version) async {
            // Create the note table
            await db.execute('''
                CREATE TABLE  IF NOT EXISTS vocabulary(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    deword TEXT DEFAULT 'Deutch',
                    mgword TEXT DEFAULT 'Malagasy'
                )
            ''');
        });
    }

    newVocabulary(Vocabulary vocabulary) async {
      final db = await database;
      var res = await db.insert('vocabulary', vocabulary.toJson());

      return res;
    }

    getVocabularies() async {
      final db = await database;
      var res = await db.query('vocabulary');
      List<Vocabulary> vocabularies = res.isNotEmpty ? res.map((vocabulary) => Vocabulary.fromJson(vocabulary)).toList() : [];

      return vocabularies;
    }

    getVocabulary(int id) async {
      final db = await database;
      var res = await db.query('vocabulary', where: 'id = ?', whereArgs: [id]);

      return res.isNotEmpty ? Vocabulary.fromJson(res.first) : null;
    }

    updateVocabulary(Vocabulary vocabulary) async {
      final db = await database;
      var res = await db.update('vocabulary', vocabulary.toJson(), where: 'id = ?', whereArgs: [vocabulary.id]);

      return res;
    }

    deleteVocabulary(int id) async {
      final db = await database;

      db.delete('vocabulary', where: 'id = ?', whereArgs: [id]);
    }
}