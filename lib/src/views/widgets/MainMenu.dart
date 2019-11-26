import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/pages/vocabularies_page.dart';
import 'package:mianatra_alemana/src/views/widgets/ContentByTitle.dart';
import 'package:mianatra_alemana/src/data/dataCases.dart';


class MainMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: this.appBarByTitle(),
                body: TabBarView(
                          children: <Widget>[
                            ContentGrammar(contentMaps),
                            MainVocabulariesPage(),
                            ContentConjugaison(),
                            ContentDialogues()
                          ],
                        ),
                    ),
      );  
  }

  Widget appBarByTitle(){
    return AppBar(
                title: TabBar(
                  isScrollable: true,
                  tabs: [
                      Tab(icon: Icon(Icons.library_books),
                      text: "Fitsipika"),
                      Tab(icon: Icon(Icons.book),
                      text: "Voambolana"),
                      Tab(icon: Icon(Icons.border_color),
                      text: "Conjugaison"),
                      Tab(icon: Icon(Icons.ac_unit),
                      text: "Dialogues"),
                    ],
                ),
              );
  }

  Widget createTab(Widget content){
    return SingleChildScrollView(
                  child: Container(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                          content,
                      ],
                    ),
                  ),
              );
  }
}