import 'dart:async';

import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/data/database.dart';
import 'package:mianatra_alemana/src/models/vocabulary_model.dart';

class ViewVocabularyBloc implements BlocBase {
    final _saveVocabularyController = StreamController<Vocabulary>.broadcast();
    StreamSink<Vocabulary> get inSaveVocabulary => _saveVocabularyController.sink;

    final _deleteVocabularyController = StreamController<int>.broadcast();
    StreamSink<int> get inDeleteVocabulary => _deleteVocabularyController.sink;

    // This bool StreamController will be used to ensure we don't do anything
    // else until a note is actually deleted from the database.
    final _vocabularyDeletedController = StreamController<bool>.broadcast();
    StreamSink<bool> get _inDeleted => _vocabularyDeletedController.sink;
    Stream<bool> get deleted => _vocabularyDeletedController.stream;

    ViewVocabularyBloc() {
        // Listen for changes to the stream, and execute a function when a change is made
        _saveVocabularyController.stream.listen(_handleSaveVocabulary);
        _deleteVocabularyController.stream.listen(_handleDeleteVocabulary);
    }

    @override
    void dispose() {
        _saveVocabularyController.close();
        _deleteVocabularyController.close();
        _vocabularyDeletedController.close();
    }

    void _handleSaveVocabulary(Vocabulary vocabulary) async {
        await DBProvider.db.updateVocabulary(vocabulary);
    }

    void _handleDeleteVocabulary(int id) async {
        await DBProvider.db.deleteVocabulary(id);

        // Set this to true in order to ensure a note is deleted
        // before doing anything else
        _inDeleted.add(true);
    }
}