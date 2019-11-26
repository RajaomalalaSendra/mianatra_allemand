import 'dart:async';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/models/dialogue_model.dart';
import 'package:mianatra_alemana/src/services/dialogue_service.dart';

class DialoguesBloc implements BlocBase {
    // Create a broadcast controller that allows this stream to be listened
    // to multiple times. This is the primary, if not only, type of stream you'll be using.
    final _dialoguesController = StreamController<List<Dialogue>>.broadcast();

    // Input stream. We add our notes to the stream using this variable.
    StreamSink<List<Dialogue>> get _inDialogues => _dialoguesController.sink;

    // Output stream. This one will be used within our pages to display the notes.
    Stream<List<Dialogue>> get dialogues => _dialoguesController.stream;

    DialoguesBloc() {
        // Retrieve all the notes on initialization
        getDialogues();
    }

    // All stream controllers you create should be closed within this function
    @override
    void dispose() {
        _dialoguesController.close();
    }

    void getDialogues() async {
        // Retrieve all the notes from the database
        List<Dialogue> dialogues = await DialogueService.db.getDialogues();

        // Add all of the notes to the stream so we can grab them later from our pages
        _inDialogues.add(dialogues);
    }
}