import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/Menu.dart';
import 'package:mianatra_alemana/src/data/dataVocabularies.dart';
import 'package:mianatra_alemana/src/data/dataConjugaisons.dart';
import 'package:mianatra_alemana/src/data/dataDialogues.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';
import 'package:mianatra_alemana/src/views/style/TextStyle.dart';
import 'package:mianatra_alemana/src/views/widgets/HomeMadeCard.dart';

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
              child: TextStyleForTitle("Nominatif", Colors.blue),
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
              child:  TextStyleForTitle("Accusatif", Colors.blue),
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
              child:  TextStyleForTitle("Datif", Colors.blue),
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
              child:  TextStyleForTitle("Genetif", Colors.blue),
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
        Row( children: <Widget>[
          Expanded(
          child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Icon(
              Icons.swap_horizontal_circle,
              color: Colors.blue
            ),
        ]),
        contentDetailVocabulariesByLanguage(malagasyToDeutch),
      ]);
  }

  Widget contentDetailVocabulariesByLanguage(Map languageVocabularies){
    List<Widget> listWidgetsVocabularies = new List<Widget>();
    List<String> mainListLanguageVocabularies = languageVocabularies.keys.toList()..sort();
    
    for (var i = 0; i < mainListLanguageVocabularies.length; i++) {
        if(i%2==0){
              listWidgetsVocabularies.add(
                SimpleTextSectionVocabulary(
                  child: Text(mainListLanguageVocabularies[i] + "  =>> " + languageVocabularies[mainListLanguageVocabularies[i]]),
                  color: Color(0xffdbf5ff),
                )
              );          
        } else {
            listWidgetsVocabularies.add(
              SimpleTextSectionVocabulary(
                child: Text(mainListLanguageVocabularies[i] + "  =>> " + languageVocabularies[mainListLanguageVocabularies[i]]),
                color: Color(0xfffff),
              )
            );
        }
    }
    return Column(children: listWidgetsVocabularies);
  }

}


class ContentConjugaison extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row( children: <Widget>[
          Expanded(
          child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Icon(
              Icons.swap_horizontal_circle,
              color: Colors.blue
            ),
        ]),
        contentDetailConjugaisonsInGerman(mapVerbs),
      ]);
  }

  Widget contentDetailConjugaisonsInGerman(Map mapVerbs){
    List<Widget> listWidgetsConjugaisons = new List<Widget>();
    List<String> mainListVerbs = mapVerbs.keys.toList()..sort();
    
    for (var i = 0; i < mainListVerbs.length; i++) {
        if(i%2==0){
              listWidgetsConjugaisons.add(
                SimpleTextSectionVocabulary(
                  child: Text(mainListVerbs[i] + "  =>> " + mapVerbs[mainListVerbs[i]]),
                  color: Color(0xffdbf5ff),
                )
              );          
        } else {
            listWidgetsConjugaisons.add(
              SimpleTextSectionVocabulary(
                child: Text(mainListVerbs[i] + "  =>> " + mapVerbs[mainListVerbs[i]]),
                color: Color(0xfffff),
              )
            );
        }
    }
    return Column(children: listWidgetsConjugaisons);
  }

}

class ContentDialogues extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ForLoopCard(titleDialogues);
  }

}


class ForLoopCard extends StatelessWidget {
  final titleDialogues;

  ForLoopCard(this.titleDialogues);
  
  @override 
  Widget build(BuildContext context){
    List<Widget> card = new List<Widget>();
    AssetImage image = AssetImage('assets/icon/icon.png');
    
    for (var i = 0; i < titleDialogues.length; i++) {
      if(i+1%2!=0 && i%2==0){
            card.add(
              Row(children: <Widget>[
                HomeMadeCardDialogue(image: Image(image: image, width: 170.0, height: 80.0), text: Text(titleDialogues[i]),),
                HomeMadeCardDialogue(image: Image(image: image, width: 170.0, height: 80.0), text: Text(titleDialogues[i+1]),),
              ]),
          );
        }
      }
      return Column(children: card);
    }
}