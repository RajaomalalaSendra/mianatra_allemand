import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mianatra_alemana/src/models/grammar_model.dart';
import 'package:mianatra_alemana/src/data/dataVocabularies.dart';
import 'package:mianatra_alemana/src/data/dataCases.dart';
import 'package:mianatra_alemana/src/data/executable_data.dart';

class GrammarService{
    
    GrammarService._();
  
    static final GrammarService db = GrammarService._();
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

          for (var i = 0; i < executable.length; i++) {
            await db.execute(executable[i]);
          }
     
          for (var i = 0; i < listVocabularies.length; i++) {
            await db.insert("vocabulary", { "word_de": listVocabularies[i]["de"], "word_mg": listVocabularies[i]["mg"],
              "expl_de": listVocabularies[i]["exp_de"], "expl_mg": listVocabularies[i]["exp_mg"], "id_type": listVocabularies[i]["typ"]});
          } 

          for(var i=0; i < listGrammars.length; i++){
            await db.insert("grammar", {"title_gram": listGrammars[i]["title"], "photo_gram": listGrammars[i]["imageUrl"],
            "subtitle_gram": listGrammars[i]["subtitle"], "num_sub_menu": listGrammars[i]["numSubMenu"]});
          }

        });
    }
  // For the vocabularies
    newGrammar(Grammar grammar) async {
      final db = await database;
      var res = await db.insert('grammar', grammar.toJson());

      return res;
    }

    getGrammars() async {
      final db = await database;
      var res = await db.query('grammar');
      List<Grammar> vocabularies = res.isNotEmpty ? res.map((vocabulary) => Grammar.fromJson(vocabulary)).toList() : [];

      return vocabularies;
    }

    getGrammar(int id) async {
      final db = await database;
      var res = await db.query('grammar', where: 'id_gram = ?', whereArgs: [id]);

      return res.isNotEmpty ? Grammar.fromJson(res.first) : null;
    }

    updateGrammar(Grammar grammar) async {
      final db = await database;
      var res = await db.update('grammar', grammar.toJson(), where: 'id_gram = ?', whereArgs: [grammar.idGram]);

      return res;
    }

    deleteGrammar(int id) async {
      final db = await database;

      db.delete('grammar', where: 'id_gram = ?', whereArgs: [id]);
    }

    deleteGrammars() async {
      final db = await database;
      db.delete('grammar');
    }
}