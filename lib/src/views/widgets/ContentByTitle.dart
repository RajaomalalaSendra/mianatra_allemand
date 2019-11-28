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
        final imageUrl = ["assets/images/n.png", "assets/images/a.png", "assets/images/d.png", "assets/images/g.png"];
        final subtitle = ["Subtitle for Nominatif", "Subtitle for Accusatif", "Subtitle for Datif", "Subtitle for Genetif"];

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
                      leading: CircleAvatar(
                        backgroundImage:  AssetImage(imageUrl[index]),
                      ),
                      subtitle: Text(subtitle[index], style: TextStyle(color: Colors.black54, fontSize: 13.0),),
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
    List<String> mainListLanguageVocabularies = malagasyToDeutch.keys.toList()..sort();
    
    return Search(
      child: ListView.builder(
      itemCount: mainListLanguageVocabularies.length,
      itemBuilder: (context, index){
        return ListTile(
                    onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefaultScaffold(
                                title: Text(mainListLanguageVocabularies[index]),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text("Malagasy word: "+mainListLanguageVocabularies[index]+" means: "+malagasyToDeutch[mainListLanguageVocabularies[index]])
                                    ],
                                  ),
                                ),
                              ),
                              ),
                            );
                        },
                      title: TextStyleForTitle(mainListLanguageVocabularies[index], Colors.blue),
                      leading: Icon(Icons.apps),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    );
        }),
      );          
     }
}

class ContentConjugaison extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<String> mainListVerbs = mapVerbs.keys.toList()..sort();
    return Search(
      child: ListView.builder(
          itemCount: mainListVerbs.length,
          itemBuilder: (context, index){
            return ListTile(
                          onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DefaultScaffold(
                                title: Text(mainListVerbs[index]),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text("Conjugaison of the verb: "+mainListVerbs[index]),
                                    ],
                                  ),
                                ),
                              ),
                              ),
                            );
                         },
                          title: TextStyleForTitle(mainListVerbs[index], Colors.blue),
                          leading: Icon(Icons.apps),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        );
      }),
    );
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

class Search extends StatelessWidget {
  const Search({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

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
        FlatButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                    content: Container(
                  child: 
                  ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text("Malagasy to Deutch", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic)),
                          leading: CircleAvatar(
                                backgroundImage:  AssetImage("assets/images/mgde.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Deutch to Malagasy", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic)),
                          leading: CircleAvatar(
                                backgroundImage:  AssetImage("assets/images/demg.png"),
                          ),
                        ),
                      ],
                    ),
                  width: 8.0,
                  height: 100.0,
                  ),
                );
              },
              );
            },
            child: Icon(
              Icons.swap_horizontal_circle,
              color: Colors.blue
            ),
           ),
        ]),
        Expanded(
          child: child,
        )
      ]);
  }
}