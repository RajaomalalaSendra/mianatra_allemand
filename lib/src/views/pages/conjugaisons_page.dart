import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/blocs/conjugaisons_bloc.dart';
import 'package:mianatra_alemana/src/blocs/view_conjugaison_bloc.dart';
import 'package:mianatra_alemana/src/models/conjugaison_model.dart';
import 'package:mianatra_alemana/src/views/screens/view_conjugaison.dart';
import 'package:mianatra_alemana/src/data/executable_data.dart';
import 'package:mianatra_alemana/src/views/style/text_style.dart';


class MainConjugaisonsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return BlocProvider(
                bloc: ConjugaisonsBloc(),
                child: ConjugaisonsPage(),
        );
    }
}

class ConjugaisonsPage extends StatefulWidget {
    ConjugaisonsPage({
        Key key,
    }) : super(key: key);

    @override
    _ConjugaisonsPageState createState() => _ConjugaisonsPageState();
}

class _ConjugaisonsPageState extends State<ConjugaisonsPage> {
    ConjugaisonsBloc _conjugaisonsBloc;

    @override
    void initState() {
        super.initState();

        // Thanks to the BlocProvider providing this page with the NotesBloc,
        // we can simply use this to retrieve it.
        _conjugaisonsBloc = BlocProvider.of<ConjugaisonsBloc>(context);
    }

    void _navigateToConjugaison(Conjugaison conjugaison) async {
        // Push ViewNotePage, and store any return value in update. This will
        // be used to tell this page to update the note stream after a note is deleted.
        // If a note isn't deleted, this will be set to null and the note stream will
        // not be updated.
        bool update = await Navigator.of(context).push(
            MaterialPageRoute(
                // Once again, use the BlocProvider to pass the ViewNoteBloc
                // to the ViewNotePage
                builder: (context) => BlocProvider(
                    bloc: ViewConjugaisonBloc(),
                    child: ViewConjugaisonPage(
                        conjugaison: conjugaison,
                    ),
                ),
            ),
        );

        // If update was set, get all the notes again, updating the stream
        if (update != null) {
            _conjugaisonsBloc.getConjugaisons();
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
                            child: StreamBuilder<List<Conjugaison>>(
                                stream: _conjugaisonsBloc.conjugaisons,
                                builder: (BuildContext context, AsyncSnapshot<List<Conjugaison>> snapshot) {
                                    // Make sure data exists and is actually loaded
                                    if (snapshot.hasData) {
                                        // If there are no notes (data), display this message.
                                        if (snapshot.data.length == 0) {
                                            return Text('No conjugaisons');
                                        }

                                        List<Conjugaison> conjugaisons = snapshot.data;

                                        return ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (BuildContext context, int index) {
                                                Conjugaison conjugaison = conjugaisons[index];

                                                return ListTile(
                                                  onTap: () {
                                                      _navigateToConjugaison(conjugaison);
                                                  },
                                                  title: TextStyleForTitle(dataConjugaisons[index]["verb"], Colors.blue),
                                                  leading: Icon(Icons.apps),
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                );
                                            });
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