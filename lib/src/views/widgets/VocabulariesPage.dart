import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/blocs/vocabularies_bloc.dart';
import 'package:mianatra_alemana/src/blocs/view_vocabulary_bloc.dart';
import 'package:mianatra_alemana/src/models/vocabulary_model.dart';
import 'package:mianatra_alemana/src/views/screens/view_vocabulary.dart';


class MainVocabulariesPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return BlocProvider(
                bloc: VocabulariesBloc(),
                child: VocabulariesPage(),
        );
    }
}

class VocabulariesPage extends StatefulWidget {
    VocabulariesPage({
        Key key,
    }) : super(key: key);

    @override
    _VocabulariesPageState createState() => _VocabulariesPageState();
}

class _VocabulariesPageState extends State<VocabulariesPage> {
    VocabulariesBloc _vocabulariesBloc;

    @override
    void initState() {
        super.initState();

        // Thanks to the BlocProvider providing this page with the NotesBloc,
        // we can simply use this to retrieve it.
        _vocabulariesBloc = BlocProvider.of<VocabulariesBloc>(context);
        _vocabulariesBloc.deleteVocabularies();
        _addVocabulary();
    }

    void _addVocabulary() async {
        Vocabulary vocabulary = new Vocabulary(wordDe: 'Deutch', wordMg: 'Malagasy');

        // Add this newly created note to the add note stream. Doing this
        // will trigger the listener in `notes_bloc.dart` and call `_handleAddNote`.
        _vocabulariesBloc.inAddVocabulary.add(vocabulary);
    }

    void _navigateToVocabulary(Vocabulary vocabulary) async {
        // Push ViewNotePage, and store any return value in update. This will
        // be used to tell this page to update the note stream after a note is deleted.
        // If a note isn't deleted, this will be set to null and the note stream will
        // not be updated.
        bool update = await Navigator.of(context).push(
            MaterialPageRoute(
                // Once again, use the BlocProvider to pass the ViewNoteBloc
                // to the ViewNotePage
                builder: (context) => BlocProvider(
                    bloc: ViewVocabularyBloc(),
                    child: ViewVocabularyPage(
                        vocabulary: vocabulary,
                    ),
                ),
            ),
        );

        // If update was set, get all the notes again, updating the stream
        if (update != null) {
            _vocabulariesBloc.getVocabularies();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Expanded(
                            // The StreamBuilder allows us to make use of our streams and display
                            // that data on our page. It automatically updates when the stream updates.
                            // Whenever you want to display stream data, you'll use the StreamBuilder.
                            child: StreamBuilder<List<Vocabulary>>(
                                stream: _vocabulariesBloc.vocabularies,
                                builder: (BuildContext context, AsyncSnapshot<List<Vocabulary>> snapshot) {
                                    // Make sure data exists and is actually loaded
                                    if (snapshot.hasData) {
                                        // If there are no notes (data), display this message.
                                        if (snapshot.data.length == 0) {
                                            return Text('No vocabularies');
                                        }

                                        List<Vocabulary> vocabularies = snapshot.data;

                                        return ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (BuildContext context, int index) {
                                                Vocabulary vocabulary = vocabularies[index];

                                                return GestureDetector(
                                                    onTap: () {
                                                        _navigateToVocabulary(vocabulary);
                                                    },
                                                    child: Container(
                                                        height: 40,
                                                        child: Row(
                                                          children: <Widget> [
                                                            Text(
                                                            vocabulary.wordDe.toString()+" "+vocabulary.idVoc.toString(),
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors.blue,
                                                            ),
                                                        ),
                                                      ],
                                                    ),
                                                ),
                                              );
                                            },
                                        );
                                    }

                                    // If the data is loading in, display a progress indicator
                                    // to indicate that. You don't have to use a progress
                                    // indicator, but the StreamBuilder has to return a widget.
                                    return Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.white70
                                        ),
                                    );
                                },
                            ),
                        ),
                    ],
                ),
            )
        );
    }
}