import 'dart:async';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/services/grammar_service.dart';
import 'package:mianatra_alemana/src/models/grammar_model.dart';

class ViewGrammarBloc implements BlocBase {
    final _saveGrammarController = StreamController<Grammar>.broadcast();
    StreamSink<Grammar> get inSaveVocabulary => _saveGrammarController.sink;

    final _deleteGrammarController = StreamController<int>.broadcast();
    StreamSink<int> get inDeleteVocabulary => _deleteGrammarController.sink;

    // This bool StreamController will be used to ensure we don't do anything
    // else until a note is actually deleted from the database.
    final _grammarDeletedController = StreamController<bool>.broadcast();
    StreamSink<bool> get _inDeleted => _grammarDeletedController.sink;
    Stream<bool> get deleted => _grammarDeletedController.stream;

    ViewGrammarBloc() {
        // Listen for changes to the stream, and execute a function when a change is made
        _saveGrammarController.stream.listen(_handleSaveGrammar);
        _deleteGrammarController.stream.listen(_handleDeleteGrammar);
    }

    @override
    void dispose() {
        _saveGrammarController.close();
        _deleteGrammarController.close();
        _grammarDeletedController.close();
    }

    void _handleSaveGrammar(Grammar grammar) async {
        await GrammarService.db.updateGrammar(grammar);
    }

    void _handleDeleteGrammar(int id) async {
        await GrammarService.db.deleteGrammar(id);

        // Set this to true in order to ensure a note is deleted
        // before doing anything else
        _inDeleted.add(true);
    }
}