import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/data/blocs/bloc_provider.dart';
import 'package:mianatra_alemana/src/data/blocs/view_vocabulary_bloc.dart';
import 'package:mianatra_alemana/src/models/vocabulary_model.dart';

class ViewVocabularyPage extends StatefulWidget {
    ViewVocabularyPage({
        Key key,
        this.vocabulary
    }) : super(key: key);

    final Vocabulary vocabulary;

    @override
    _ViewVocabularyPageState createState() => _ViewVocabularyPageState();
}

class _ViewVocabularyPageState extends State<ViewVocabularyPage> {
    ViewVocabularyBloc _viewVocabularyBloc;
    TextEditingController _dewordVocabularyController = new TextEditingController();
    TextEditingController _mgwordVocabularyController = new TextEditingController();

    @override
    void initState() {
        super.initState();

        _viewVocabularyBloc = BlocProvider.of<ViewVocabularyBloc>(context);
        _dewordVocabularyController.text = widget.vocabulary.deword;
        _mgwordVocabularyController.text = widget.vocabulary.mgword;

    }

    void _saveVocabulary() async {
        widget.vocabulary.deword = _dewordVocabularyController.text;
        widget.vocabulary.mgword = _mgwordVocabularyController.text;

        // Add the updated note to the save note stream. This triggers the function
        // we set in the listener.
        _viewVocabularyBloc.inSaveVocabulary.add(widget.vocabulary);
    }

    void _deleteVocabulary() {
        // Add the note id to the delete note stream. This triggers the function
        // we set in the listener.
        _viewVocabularyBloc.inDeleteVocabulary.add(widget.vocabulary.id);

        // Wait for `deleted` to be set before popping back to the main page. This guarantees there's no
        // mismatch between what's stored in the database and what's being displayed on the page.
        // This is usually only an issue with more database heavy actions, but it's a good thing to
        // add regardless.
        _viewVocabularyBloc.deleted.listen((deleted) {
            if (deleted) {
                // Pop and return true to let the main page know that a note was deleted and that
                // it has to update the note stream.
                Navigator.of(context).pop(true);
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.vocabulary.deword.toString() + "..." + widget.vocabulary.mgword.toString()),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.save),
                        onPressed: _saveVocabulary,
                    ),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: _deleteVocabulary,
                    ),
                ],
            ),
            body: Container(
                child: Column(
                  children: <Widget>[
                    TextField(
                      maxLines: null,
                      controller: _dewordVocabularyController,
                    ),

                    TextField(
                      maxLines: null,
                      controller: _mgwordVocabularyController,
                    ),
                  ],
                ),
            ),
        );
    }
}