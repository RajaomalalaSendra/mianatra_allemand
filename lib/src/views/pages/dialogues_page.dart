import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/blocs/dialogues_bloc.dart';
import 'package:mianatra_alemana/src/blocs/view_dialogue_bloc.dart';
import 'package:mianatra_alemana/src/models/dialogue_model.dart';
import 'package:mianatra_alemana/src/views/screens/view_dialogue.dart';
import 'package:mianatra_alemana/src/views/widgets/HomeMadeCard.dart';


class MainDialoguesPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return BlocProvider(
                bloc: DialoguesBloc(),
                child: DialoguesPage(),
        );
    }
}

class DialoguesPage extends StatefulWidget {
    DialoguesPage({
        Key key,
    }) : super(key: key);

    @override
    _DialoguesPageState createState() => _DialoguesPageState();
}

class _DialoguesPageState extends State<DialoguesPage> {
    DialoguesBloc _dialoguesBloc;

    @override
    void initState() {
        super.initState();

        // Thanks to the BlocProvider providing this page with the NotesBloc,
        // we can simply use this to retrieve it.
        _dialoguesBloc = BlocProvider.of<DialoguesBloc>(context);
    }

    void _navigateToDialogue(Dialogue dialogue) async {
        // Push ViewNotePage, and store any return value in update. This will
        // be used to tell this page to update the note stream after a note is deleted.
        // If a note isn't deleted, this will be set to null and the note stream will
        // not be updated.
        bool update = await Navigator.of(context).push(
            MaterialPageRoute(
                // Once again, use the BlocProvider to pass the ViewNoteBloc
                // to the ViewNotePage
                builder: (context) => BlocProvider(
                    bloc: ViewDialogueBloc(),
                      child: ViewDialoguePage(
                        dialogue: dialogue,
                    ),
                ),
            ),
        );

        // If update was set, get all the notes again, updating the stream
        if (update != null) {
            _dialoguesBloc.getDialogues();
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
                            child: StreamBuilder<List<Dialogue>>(
                                stream: _dialoguesBloc.dialogues,
                                builder: (BuildContext context, AsyncSnapshot<List<Dialogue>> snapshot) {
                                    // Make sure data exists and is actually loaded
                                    if (snapshot.hasData) {
                                        // If there are no notes (data), display this message.
                                        if (snapshot.data.length == 0) {
                                            return Text('No Dialogues');
                                        }

                                        List<Dialogue> dialogues = snapshot.data;

                                        return GridView.count(
                                                    crossAxisCount: 2,
                                                    children: List.generate(dialogues.length, (index){
                                                        Dialogue dialogue = dialogues[index];
                                                        
                                                        return Card(
                                                          child: FlatButton(
                                                            onPressed: (){
                                                              _navigateToDialogue(dialogue);
                                                            },
                                                          child: HomeMadeCardDialogue(image: Image(image: AssetImage(dialogue.photoDialogue), width: 140.0, height: 70.0), text: Text(dialogue.titleDialogue),),
                                                          ),
                                                          shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                                          ),
                                                          elevation: 7.0,
                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                        );
                                                        }),
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