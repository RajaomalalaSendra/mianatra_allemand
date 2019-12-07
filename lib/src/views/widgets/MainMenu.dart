import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/pages/dialogues_page.dart';
import 'package:mianatra_alemana/src/views/pages/vocabularies_page.dart';
import 'package:mianatra_alemana/src/views/pages/grammars_page.dart';
import 'package:mianatra_alemana/src/views/pages/conjugaisons_page.dart';

class MainMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: this.appBarByTitle(),
                body: TabBarView(
                          children: <Widget>[
                            MainGramarsPage(),
                            MainVocabulariesPage(),
                            MainConjugaisonsPage(),
                            MainDialoguesPage(),
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
}