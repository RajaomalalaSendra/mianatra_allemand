import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/models/grammar_model.dart';
import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';

class ViewGrammarPage extends StatefulWidget {
    ViewGrammarPage({
        Key key,
        this.grammar,
        this.contentMaps

    }) : super(key: key);

    final Grammar grammar;
    final Map contentMaps;

    @override
    _ViewGrammarPageState createState() => _ViewGrammarPageState();
}

class _ViewGrammarPageState extends State<ViewGrammarPage> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return TabBarMianatraAlemana(widget.grammar.titleGram.toString(), widget.contentMaps);
    }

    
}