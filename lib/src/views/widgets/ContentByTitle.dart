import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/Menu.dart';
import 'package:mianatra_alemana/src/data/dataVocabularies.dart';
import 'package:mianatra_alemana/src/data/dataConjugaisons.dart';
import 'package:mianatra_alemana/src/data/dataDialogues.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';
import 'package:mianatra_alemana/src/views/style/TextStyle.dart';
import 'package:mianatra_alemana/src/views/widgets/HomeMadeCard.dart';
import 'package:mianatra_alemana/src/views/widgets/DefaultScaffold.dart';
import 'package:mianatra_alemana/src/views/widgets/DetailDialogues.dart';

class ContentGrammar extends StatelessWidget{

  final List _title;
  final List _columnsTitle;
  final  _contentLists;
  final Map _examplesByCase;
  final List routeName;

  ContentGrammar(this._title, this._columnsTitle, this._contentLists, this._examplesByCase, this.routeName);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _title.length,
      itemBuilder: (context, index){
        final title = _title[index];
        final content = _contentLists[index];
        final route = routeName[index];

        return Card(
                  child: InkWell(
                    child: ListTile(
                      onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExtractArgumentsScreenMianatraAlemana(title, _columnsTitle, content, _examplesByCase, route),
                              ),
                            );
                        },
                      title: TextStyleForTitle(title, Colors.blue),
                      leading: TextStyleForTitle("sample ${index+1}", Colors.red),
                      subtitle: TextStyleForTitle("Subtitle for number ${index+1}", Colors.green),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                );
      }
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
    return ForLoopCard(dialogues);
  }

}


class ForLoopCard extends StatelessWidget {
  final Map dialogues;

  ForLoopCard(this.dialogues);
  
  @override 
  Widget build(BuildContext context){
    AssetImage image = AssetImage('assets/icon/icon.png');
    List<String> listkeydialogues = dialogues.keys.toList();
    
    return GridView.count(
              crossAxisCount: 2,
              children: List.generate(dialogues.length, (index){
                  return Card(
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DefaultScaffold(
                                title: Text("Dialogue ${index+1}"),
                                child: SingleChildScrollView(
                                  child: DetailDialogue(image: AssetImage(dialogues[listkeydialogues[index]]["image"]), mapContentDialogue: dialogues[listkeydialogues[index]]),
                                ),
                              ),
                            ),
                          );
                      },
                    child: HomeMadeCardDialogue(image: Image(image: image, width: 140.0, height: 70.0), text: Text(listkeydialogues[index]),),
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
}