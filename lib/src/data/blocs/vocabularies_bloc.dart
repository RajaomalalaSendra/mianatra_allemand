import 'dart:async';

import 'package:mianatra_alemana/src/data/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/data/database.dart';
import 'package:mianatra_alemana/src/models/vocabulary_model.dart';

class VocabulariesBloc implements BlocBase {
    // Create a broadcast controller that allows this stream to be listened
    // to multiple times. This is the primary, if not only, type of stream you'll be using.
    final _vocabulariesController = StreamController<List<Vocabulary>>.broadcast();

    // Input stream. We add our notes to the stream using this variable.
    StreamSink<List<Vocabulary>> get _inVocabularies => _vocabulariesController.sink;

    // Output stream. This one will be used within our pages to display the notes.
    Stream<List<Vocabulary>> get vocabularies => _vocabulariesController.stream;

    // Input stream for adding new notes. We'll call this from our pages.
    final _addVocabularyController = StreamController<Vocabulary>.broadcast();
    StreamSink<Vocabulary> get inAddVocabulary => _addVocabularyController.sink;

    VocabulariesBloc() {
        // Retrieve all the notes on initialization
        getVocabularies();

        // Listens for changes to the addNoteController and calls _handleAddNote on change
        _addVocabularyController.stream.listen(_handleAddVocabulary);
    }

    // All stream controllers you create should be closed within this function
    @override
    void dispose() {
        _vocabulariesController.close();
        _addVocabularyController.close();
    }

    void getVocabularies() async {
        // Retrieve all the notes from the database
        List<Vocabulary> vocabularies = await DBProvider.db.getVocabularies();

        // Add all of the notes to the stream so we can grab them later from our pages
        _inVocabularies.add(vocabularies);
    }

    void _handleAddVocabulary(Vocabulary vocabulary) async {
        // Create the note in the database
        await DBProvider.db.newVocabulary(vocabulary);

        // Retrieve all the notes again after one is added.
        // This allows our pages to update properly and display the
        // newly added note.
        getVocabularies();
    }
}