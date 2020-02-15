import 'dart:io';
import 'package:mianatra_alemana/src/models/conjugaison_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConjugaisonService{
    
    ConjugaisonService._();
  
    static final ConjugaisonService db = ConjugaisonService._();
    Database _database;

    Future<Database> get database async {
        if (_database != null) {
            return _database;
        }

        _database = await initDB();
        return _database;
    }

    initDB() async {
        Directory documentsDir = await getApplicationDocumentsDirectory();
        String path = join(documentsDir.path, 'app.db');
        
        return await openDatabase(path, version: 1, onOpen: (db) async {
        }, onCreate: (Database db, int version) async {

        });
    }
  
    getConjugaisons() async {
      final db = await database;
      var res = await db.query('conjugaison');
      List<Conjugaison> conjugaisons = res.isNotEmpty ? res.map((conjugaison) => Conjugaison.fromJson(conjugaison)).toList() : [];

      return conjugaisons;
    }
}