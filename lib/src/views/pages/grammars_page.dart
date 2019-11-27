import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/blocs/grammars_bloc.dart';
import 'package:mianatra_alemana/src/blocs/view_grammar_bloc.dart';
import 'package:mianatra_alemana/src/models/grammar_model.dart';
import 'package:mianatra_alemana/src/views/screens/view_grammar.dart';
import 'package:mianatra_alemana/src/data/dataCases.dart';
import 'package:mianatra_alemana/src/views/style/text_style.dart';


class MainGramarsPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return BlocProvider(
                bloc: GrammarsBloc(),
                child: GrammarsPage(),
        );
    }
}

class GrammarsPage extends StatefulWidget {
    GrammarsPage({
        Key key,
    }) : super(key: key);

    @override
    _GrammarsPageState createState() => _GrammarsPageState();
}

class _GrammarsPageState extends State<GrammarsPage> {
    GrammarsBloc _grammarsBloc;

    @override
    void initState() {
        super.initState();

        // Thanks to the BlocProvider providing this page with the NotesBloc,
        // we can simply use this to retrieve it.
        _grammarsBloc = BlocProvider.of<GrammarsBloc>(context);
    }

    // void _addGrammars() async {
        
    //     for (var i = 0; i < listGrammars.length; i++) {
        
    //     Grammar grammar  = new Grammar(titleGram: listGrammars[i]["title"], photoGram: listGrammars[i]["imageUrl"],
    //     subtitleGram: listGrammars[i]["subtitle"], numSubMenu: listGrammars[i]["numSubMenu"]);
        
    //     // Add this newly created note to the add note stream. Doing this
    //     // will trigger the listener in `notes_bloc.dart` and call `_handleAddNote`.
    //     _grammarsBloc.inAddGrammar.add(grammar);
    //     } 
    // }

    void _navigateToGrammar(Grammar grammar) async {
        // Push ViewNotePage, and store any return value in update. This will
        // be used to tell this page to update the note stream after a note is deleted.
        // If a note isn't deleted, this will be set to null and the note stream will
        // not be updated.
        bool update = await Navigator.of(context).push(
            MaterialPageRoute(
                // Once again, use the BlocProvider to pass the ViewNoteBloc
                // to the ViewNotePage
                builder: (context) => BlocProvider(
                    bloc: ViewGrammarBloc(),
                    child: ViewGrammarPage(
                        grammar: grammar,
                        contentMaps: contentMaps,
                    ),
                ),
            ),
        );

        // If update was set, get all the notes again, updating the stream
        if (update != null) {
            _grammarsBloc.getGrammars();
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
                            child: StreamBuilder<List<Grammar>>(
                                stream: _grammarsBloc.grammars,
                                builder: (BuildContext context, AsyncSnapshot<List<Grammar>> snapshot) {
                                    // Make sure data exists and is actually loaded
                                    if (snapshot.hasData) {
                                        // If there are no notes (data), display this message.
                                        if (snapshot.data.length == 0) {
                                            return Text('No Grammar');
                                        }

                                        List<Grammar> grammars = snapshot.data;

                                        return ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (BuildContext context, int index) {
                                                Grammar grammar = grammars[index];

                                                return ListTile(
                                                  onTap: () {
                                                      _navigateToGrammar(grammar);
                                                  },
                                                  title: TextStyleForTitle(listGrammars[index]["title"], Colors.blue),
                                                  leading: CircleAvatar(
                                                      backgroundImage:  AssetImage(listGrammars[index]["imageUrl"]),
                                                    ),
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                  subtitle: Text("${listGrammars[index]["subtitle"]}", style: TextStyle(color: Colors.black54, fontSize: 13.0),),
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