import 'dart:async';
import 'package:mianatra_alemana/src/models/vocabulary_model.dart';

abstract class ServiceVocabularies{
  Future<void> insertVocabularies(Vocabulary vocabulary);
  vocabularies();
  Future<void> updateVocabularies(Vocabulary vocabulary, int id);
  Future<void> deleteVocabularies(int id);
}