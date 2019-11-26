import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/models/dialogue_model.dart';

class ViewDialoguePage extends StatefulWidget {
    ViewDialoguePage({
        Key key,
        this.dialogue
    }) : super(key: key);

    final Dialogue dialogue;

    @override
    _ViewDialoguePageState createState() => _ViewDialoguePageState();
}

class _ViewDialoguePageState extends State<ViewDialoguePage> {

    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.dialogue.idDialogue.toString() + "..." + widget.dialogue.titleDialogue.toUpperCase()),
            ),
            body: Container(
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage(widget.dialogue.photoDialogue.toString()),),
                    Text(widget.dialogue.titleDialogue.toUpperCase()),
                    Text(widget.dialogue.textDialogueDe.toString()),
                    Text(widget.dialogue.textDialogueMg.toString()),
                    Text(widget.dialogue.audioDialogue.toString()),
                    Text(widget.dialogue.explDialogue.toString()),
                    Text(widget.dialogue.videoDialogue.toString()),
                  ],
                ),
            ),
        );
    }
}