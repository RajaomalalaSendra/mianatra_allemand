import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/models/conjugaison_model.dart';

class ViewConjugaisonPage extends StatefulWidget {
    ViewConjugaisonPage({
        Key key,
        this.conjugaison
    }) : super(key: key);

    final Conjugaison conjugaison;

    @override
    _ViewConjugaisonPageState createState() => _ViewConjugaisonPageState();
}

class _ViewConjugaisonPageState extends State<ViewConjugaisonPage> {

    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.conjugaison.idVerb.toString() + "..." + widget.conjugaison.verb.toUpperCase()),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text("Verb: " + widget.conjugaison.verb.toUpperCase()),
                    Text("Id Group Verb: " + widget.conjugaison.idGroupVerb.toString()),
                    Text("Present Ind: " + widget.conjugaison.presentInd.toString()),
                    Text("Participe: " + widget.conjugaison.participe.toString()),
                    Text("Future: " + widget.conjugaison.futureInd.toString()),
                    Text("Past: " + widget.conjugaison.pastInd.toString()),
                  ],
                ),
              ),
            ),
        );
    }
}