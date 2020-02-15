import 'dart:async';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/models/conjugaison_model.dart';
import 'package:mianatra_alemana/src/services/conjugaison_service.dart';

class ConjugaisonsBloc implements BlocBase {
    // Create a broadcast controller that allows this stream to be listened
    // to multiple times. This is the primary, if not only, type of stream you'll be using.
    final _conjugaisonsController = StreamController<List<Conjugaison>>.broadcast();

    // Input stream. We add our notes to the stream using this variable.
    StreamSink<List<Conjugaison>> get _inConjugaisons => _conjugaisonsController.sink;

    // Output stream. This one will be used within our pages to display the notes.
    Stream<List<Conjugaison>> get conjugaisons => _conjugaisonsController.stream;

    ConjugaisonsBloc() {
        // Retrieve all the notes on initialization
        getConjugaisons();
    }

    // All stream controllers you create should be closed within this function
    @override
    void dispose() {
        _conjugaisonsController.close();
    }

    void getConjugaisons() async {
        // Retrieve all the notes from the database
        List<Conjugaison> conjugaisons = await ConjugaisonService.db.getConjugaisons();

        // Add all of the notes to the stream so we can grab them later from our pages
        _inConjugaisons.add(conjugaisons);
    }
}