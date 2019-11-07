import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/Menu.dart';
import 'package:mianatra_alemana/src/data/dataVocabularies.dart';

class ContentGrammar extends StatelessWidget{

  final List _title;
  final List _columnsTitle;
  final  _contentLists;
  final Map _examplesByCase;
  final List routeName;

  ContentGrammar(this._title, this._columnsTitle, this._contentLists, this._examplesByCase, this.routeName);

  @override
  Widget build(BuildContext context) {
    ExtractArgumentsScreenMianatraAlemana mianatraAlemanaNominatif = new ExtractArgumentsScreenMianatraAlemana(_title[0], _columnsTitle, _contentLists[0], _examplesByCase, routeName[0]);
    ExtractArgumentsScreenMianatraAlemana mianatraAlemanaAccusatif = new ExtractArgumentsScreenMianatraAlemana(_title[1], _columnsTitle, _contentLists[1], _examplesByCase, routeName[1]);
    ExtractArgumentsScreenMianatraAlemana mianatraAlemanaDatif = new ExtractArgumentsScreenMianatraAlemana(_title[2], _columnsTitle, _contentLists[2], _examplesByCase, routeName[2]);
    ExtractArgumentsScreenMianatraAlemana mianatraAlemanaGenetif = new ExtractArgumentsScreenMianatraAlemana(_title[3], _columnsTitle, _contentLists[3], _examplesByCase, routeName[3]);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mianatraAlemanaNominatif,
                    ),
                  );
              },
              child: Text("Nominatif"),
            )
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mianatraAlemanaAccusatif,
                    ),
                  );
              },
              child: Text("Accusatif"),
            )
          ],
        ),
        Row(
            children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mianatraAlemanaDatif,
                    ),
                  );
              },
              child: Text("Datif"),
            )
          ],
        ),
        Row(
            children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mianatraAlemanaGenetif,
                    ),
                  );
              },
              child: Text("Genetif"),
            )
          ],
        ),
      ],
    );
  }
}

class ContentVocabularies extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
          ),
        ),
        contentDetailVocabulariesByLanguage(malagasyToDeutch),
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Test Threee")
          ],
        ),
      ],
    );
  }

  Widget contentDetailVocabulariesByLanguage(Map languageVocabularies){
    List<Widget> listWidgetsVocabularies = new List<Widget>();
    List<String> firstListLanguageVocabularies = languageVocabularies.keys.toList();
    List<String> secondListLanguageVocabularies = languageVocabularies.values.toList();
  
    for (var i = 0; i < firstListLanguageVocabularies.length; i++) {
        listWidgetsVocabularies.add(
          Text(firstListLanguageVocabularies[i] + "  =>> " + secondListLanguageVocabularies[i])
        );
    }
    return Column(children: listWidgetsVocabularies);
  }

}


class ContentConjugaison extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Test Threee")
          ],
        ),
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Test Threee")
          ],
        ),
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Test Threee")
          ],
        ),
      ],
    );
  }
}

class ContentDialogues extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Dialogue One")
          ],
        ),
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Dialogue Two")
          ],
        ),
        Row(
          children: <Widget>[
            Text("Test"),
            Text("Dialogue Three")
          ],
        ),
      ],
    );
  }
}