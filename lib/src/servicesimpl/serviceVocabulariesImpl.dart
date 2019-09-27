// import 'dart:async';

// import 'package:sqflite/sqflite.dart';
// import 'package:mianatra_alemana/src/services/serviceVocabularies.dart';
// import 'package:mianatra_alemana/src/model/Vocabularies.dart';
// import 'package:mianatra_alemana/src/data/config.dart';

// class ServiceVocabulariesImpl implements ServiceVocabularies {
  
//   final database = openDataBase("CREATE TABLE  IF NOT EXISTS vocabularies(id INTEGER PRIMARY KEY AUTOINCREMENT, deword TEXT, mgword TEXT)");

//   @override
//   Future<void> insertVocabularies(Vocabularies vocabularies) async{
//     final Database db = await database;

//     // Insert the Dog into the correct table. Also specify the
//     // `conflictAlgorithm`. In this case, if the same dog is inserted
//     // multiple times, it replaces the previous data.
//     await db.insert(
//       'vocabularies',
//       vocabularies.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
  
//   @override
//   vocabularies() async {
//     // Get a reference to the database.
//     final Database db = await database;

//     // Query the table for all The Dogs.
//     final maps = await db.query('vocabularies');


//     List<Vocabularies> vocabularies = maps.isNotEmpty ? maps.map((vocab) => Vocabularies.fromMap(vocab)).toList() : [];
//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return vocabularies;
//   }

//   @override
//   Future<void> updateVocabularies(Vocabularies vocabularies, int id) async{
//     // Get a reference to the database.
//     final db = await database;

//     // Update the given Dog.
//     await db.update(
//       'vocabularies',
//       vocabularies.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: "id = ?",
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }
  
//   @override
//   Future<void> deleteVocabularies(int id) async {
    
//     // Get a reference to the database.
//     final db = await database;

//     // Remove the Dog from the database.
//     await db.delete(
//       'vocabularies',
//       // Use a `where` clause to delete a specific dog.
//       where: "id = ?",
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [id],
//     );
//   }

// }