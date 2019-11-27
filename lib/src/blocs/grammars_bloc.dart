import 'dart:async';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/services/grammar_service.dart';
import 'package:mianatra_alemana/src/models/grammar_model.dart';

class GrammarsBloc implements BlocBase {
    // Create a broadcast controller that allows this stream to be listened
    // to multiple times. This is the primary, if not only, type of stream you'll be using.
    final _grammarsController = StreamController<List<Grammar>>.broadcast();

    // Input stream. We add our notes to the stream using this variable.
    StreamSink<List<Grammar>> get _inGrammars => _grammarsController.sink;

    // Output stream. This one will be used within our pages to display the notes.
    Stream<List<Grammar>> get grammars => _grammarsController.stream;

    // Input stream for adding new notes. We'll call this from our pages.
    final _addGrammarController = StreamController<Grammar>.broadcast();
    StreamSink<Grammar> get inAddGrammar => _addGrammarController.sink;

    GrammarsBloc() {
        // Retrieve all the notes on initialization
        getGrammars();

        // Listens for changes to the addNoteController and calls _handleAddNote on change
        _addGrammarController.stream.listen(_handleAddGrammar);
    }

    // All stream controllers you create should be closed within this function
    @override
    void dispose() {
        _grammarsController.close();
        _addGrammarController.close();
    }

    void getGrammars() async {
        // Retrieve all the notes from the database
        List<Grammar> grammars = await GrammarService.db.getGrammars();

        // Add all of the notes to the stream so we can grab them later from our pages
        _inGrammars.add(grammars);
    }

    void _handleAddGrammar(Grammar grammar) async {
        // Create the note in the database
        await GrammarService.db.newGrammar(grammar);

        // Retrieve all the notes again after one is added.
        // This allows our pages to update properly and display the
        // newly added note.
        getGrammars();
    }

    void deleteGrammars() async {
        // Retrieve all the notes from the database
        List<Grammar> grammars = await GrammarService.db.deleteGrammars();
        _inGrammars.add(grammars);
    }
}