import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';
import 'package:mianatra_alemana/src/views/widgets/SizeBox.dart';
import 'package:mianatra_alemana/src/data/dataCases.dart';

class TabBarMianatraAlemana extends StatelessWidget {
  final  String _title;
  final List _columnsTitle;
  final _contentLists;
  final List _examplesByCase;

  TabBarMianatraAlemana(this._title, this._columnsTitle, this._contentLists, this._examplesByCase);

 @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: this.appBarByCase(),
              body: TabBarView(
                        children: [
                          Tab(
                            child: SingleChildScrollView( 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Icon(Icons.library_books),
                                  this.createCases(_contentLists),
                                ]
                              ),   
                            ),                         
                          ),

                          Tab(
                            child: Column(
                              children: <Widget>[
                                  Icon(Icons.book),
                                  this.createExamplesByCase(_examplesByCase),
                              ],
                            ),
                          ),
                          Icon(Icons.border_color),
                        ],
                      ),
                  ),
          ),
    );
  }

  Widget createCases(var contentLists){
    MianatraAlemanaRowsAndColumns alemanaRows = new MianatraAlemanaRowsAndColumns();
    if(_title == "Nominatif"){
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehefa ao arinanan'ny matoanteny \"sein\" dia ampiasaina ny \"Nominatif\""),
            SimpleTextSection("- Ny teny rehetra rehefa entimilaza dia ampiasaina ny \"Nominatif\""),

            alemanaRows.twoColumns("2/ Famintinana", _columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),
          ]
        );

        return cases;
    } else {
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehetra ao arinanan'ny matoanteny ankoatran'ny \"sein\" dia ampiasaina ny \"Accusatif\""),
            
            alemanaRows.twoColumns("2/ Famintinana", _columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),
          ]
      );

      return cases;
    }
  }

  Widget appBarByCase(){
    return  AppBar(
                bottom: TabBar(
                  tabs: [
                      Tab(icon: Icon(Icons.library_books),
                      text: "Lesona"),
                      Tab(icon: Icon(Icons.book),
                      text: "Ohatra"),
                      Tab(icon: Icon(Icons.border_color),
                      text: "Fampiharana"),
                    ],
                ),
                title: Text(_title),
              );
  }

  Widget createExamplesByCase(var examplesByCase){
    return Column(
        children:[
            TextSection("Ohatra", examplesByCase[0]),
            SimpleTextSection(examplesByCase[1]),
        ]
    );
  }

}

class TabBarHomeMenu  extends StatelessWidget {

  Widget build(BuildContext context){
    return   Scaffold(
      body: 
          Column(
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  HomeMenuSizeBoxGrammar("Grammaire"),
                  HomeMenuSizeBoxVocabularies("Vocabulaire"),
              ],
          ), 
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                  HomeMenuSizeBoxDialogues("Dialogues"),
                  HomeMenuSizeBoxDialogues("Dialogu"),
              ],
          ),
        ],
      ),
    );
  }
}

class TabBarMainMenuGrammar  extends StatelessWidget {

  Widget build(BuildContext context){
    return   Scaffold(
      body: 
          Column(
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  MainMenuSizeBoxCases("Cas"),
                  MainMenuSizeBoxConjugaison("Conjugaison"),
              ],
          ), 
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainMenuSizeBoxTexts("Textes"),
          ],)
        ],
      ),
    );
  }
}

class TabBarSecondMenuCases extends StatelessWidget {  

  Widget build(BuildContext context){
    return   Scaffold(
      body: 
          Column(
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  SecondMenuSizeBoxCases("Nominatif", columnsTitle, contentListsNominatif, examplesOfNominatif),
                  SecondMenuSizeBoxCases("Accusatif", columnsTitle, contentListsAccusatif, examplesOfAccusatif),
              ],
          ), 
        ],
      ),
    );
  }
}