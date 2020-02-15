import 'package:mianatra_alemana/src/models/vocabulary_model.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VocabularyService{
    
    VocabularyService._();
  
    static final VocabularyService db = VocabularyService._();
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
        });
    }
  // For the vocabularies
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
      var res = await db.query('vocabulary', where: 'id_voc = ?', whereArgs: [id]);

      return res.isNotEmpty ? Vocabulary.fromJson(res.first) : null;
    }

    updateVocabulary(Vocabulary vocabulary) async {
      final db = await database;
      var res = await db.update('vocabulary', vocabulary.toJson(), where: 'id_voc = ?', whereArgs: [vocabulary.idVoc]);

      return res;
    }

    deleteVocabulary(int id) async {
      final db = await database;

      db.delete('vocabulary', where: 'id_voc = ?', whereArgs: [id]);
    }

    deleteVocabularies() async {
      final db = await database;
      db.delete('vocabulary');
    }
}