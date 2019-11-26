import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/Menu.dart';
import 'package:mianatra_alemana/src/data/dataVocabularies.dart';
import 'package:mianatra_alemana/src/data/dataConjugaisons.dart';
import 'package:mianatra_alemana/src/data/dataDialogues.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';
import 'package:mianatra_alemana/src/views/style/text_style.dart';
import 'package:mianatra_alemana/src/views/widgets/search.dart';
import 'package:mianatra_alemana/src/views/widgets/HomeMadeCard.dart';
import 'package:mianatra_alemana/src/views/widgets/DefaultScaffold.dart';
import 'package:mianatra_alemana/src/views/widgets/DetailDialogues.dart';

class ContentGrammar extends StatelessWidget{

  final  Map _contentMaps;

  ContentGrammar(this._contentMaps);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _contentMaps["TitlesCases"].length,
      itemBuilder: (context, index){
        final String title = _contentMaps["TitlesCases"][index];
        final Map content = _contentMaps; 
        final List imageUrl = _contentMaps["imageUrl"];
        final List subtitle = _contentMaps["subtitle"];

        return Card(
                  child: InkWell(
                    child: ListTile(
                      onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExtractArgumentsScreenMianatraAlemana(title, content),
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
