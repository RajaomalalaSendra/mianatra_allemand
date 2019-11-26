import 'dart:io';
import 'package:mianatra_alemana/src/models/dialogue_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DialogueService{
    
    DialogueService._();
  
    static final DialogueService db = DialogueService._();
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
  
    getDialogues() async {
      final db = await database;
      var res = await db.query('dialogue');
      List<Dialogue> dialogues = res.isNotEmpty ? res.map((dialogue) => Dialogue.fromJson(dialogue)).toList() : [];

      return dialogues;
    }
}