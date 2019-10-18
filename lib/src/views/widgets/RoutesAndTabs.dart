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
    return   DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: this.appBarByCase(),
              body: TabBarView(
                        children: [
                          this.createTab(this.createCases(_contentLists)),
                          this.createTab(this.createExamplesByCase(_examplesByCase)),
                          this.createTab(TextInputByCase()),
                        ],
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
           
           
            TextSection("3/ Nominatif miaraka amin'ny adjectif", "-  Ny adjectif ihany koa rehefa eo alohan'ny teny \nanankiray dia manaraka ny genre sy ny isany"),
            SimpleTextSection("Sahala amin'izao no fampiasana azy:\n article + adjectif miafara amin'ilay genre ny article + anarana iombonana."),

            alemanaRows.twoColumns("2/ Teny Miafara ao anatin'ny adjectif", _columnsTitle),
            alemanaRows.contentColumn(["r na er", "e", "es", "e"]),
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

  Widget createExamplesByCase(List examplesByCase){
    /// create example by case
    /// And you can check the documentation here
  
    return Column(
        children:[
            TextSection("Ohatra Voalohany", examplesByCase[0]),
            SimpleTextSection(">> " + examplesByCase[8]),

            SimpleTextSection(examplesByCase[1]),
            SimpleTextSection(">> " + examplesByCase[9]),
            
            SimpleTextSection(examplesByCase[2]),
            SimpleTextSection(">> " + examplesByCase[10]),

            SimpleTextSection(examplesByCase[3]),
            SimpleTextSection(">> " + examplesByCase[11]),

            TextSection("Ohatra faharoa miaraka amin'ny adjectif", examplesByCase[4]),
            SimpleTextSection(">> " + examplesByCase[12]),

            SimpleTextSection(examplesByCase[5]),
            SimpleTextSection(">> " + examplesByCase[13]),
            
            SimpleTextSection(examplesByCase[6]),
            SimpleTextSection(">> " + examplesByCase[14]),

            SimpleTextSection(examplesByCase[7]),
            SimpleTextSection(">> " + examplesByCase[15]),
        ],
    );
  }

  Widget createTab(Widget content){
      return Tab(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                          content,
                      ],
                    ),
                  ),
                ),
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
                  HomeMenuSizeBoxDialogues("Dialogues II"),
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

class TabBarMainMenuVocabularies extends StatelessWidget {
  final List<String> textOne = ['Das Obst', 'Das Gemuse', 'Die Apfel', 'Der Druker', 'Die Kulie'];
  final List<String> textTwo = ['Ny voankazo', 'Ny legioma', 'Ny poma', 'Ny imprimante', 'Ny penina'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this.getColumnWidgets(textOne, textTwo),
    );
  }

  Widget getRow(String wordOne, String wordTwo){
    return Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: wordOne.length.toDouble() + 100),
                    child: Text(wordOne),
                  ),
                  Text(wordTwo),
                ],
              ),
            );
  }

  Widget getColumnWidgets(List<String> strings, List<String> stringsTwo){
    
    List<Widget> list = new List<Widget>();
    
    for(var i = 0; i < strings.length; i++){
        list.add(this.getRow(strings[i], stringsTwo[i]));
    }
    return Column(children: list);
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

class TextInputByCase extends StatefulWidget {
  @override
  _CreateExercicesByCase createState() => new _CreateExercicesByCase();
}

class _CreateExercicesByCase extends State<TextInputByCase>{

    String result = "";

    @override
    Widget build(BuildContext context){
      return Column (
            children: <Widget>[
              rowConstrainedBoxByCase("Das ist", "Frau", "die"),
              rowConstrainedBoxByCase("Du bist ", "Lehrer", "der"),
              rowConstrainedBoxByCase("Sie sind", "Studenten", "die"),
            ],
      );
    }

    Widget rowConstrainedBoxByCase(String textOne, String textTwo, String theanswer){
      return Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  constrainedBoxByCase(textOne, textTwo, theanswer),  
                ],
              );
    }
    
    Widget constrainedBoxByCase(String textOne, String textTwo, String theanswer){
      return ConstrainedBox(
                  constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
                  child:  Center(
                    child: Wrap(
                      alignment: WrapAlignment.end, children: [
                      Text(textOne),
                      TextField(
                          decoration: InputDecoration(
                           hintText: "der/die/das",
                        ),
                        cursorWidth: 1.5,
                        maxLength: 3,
                        scrollPadding: EdgeInsets.all(10),
                        //onChanged is called whenever we add or delete something on Text Field
                        onSubmitted: (String str){
                          setState((){
                            result = str;
                          });
                        }
                      ),
                    Text(textTwo),
                    //displaying input text
                    computeComparisonAnswer(result, theanswer),
              ]),
            ),      
        );
    }

    Widget computeComparisonAnswer(String answer, String answerTwo){
      Widget comparisonAnswer = Text("Default");
      
      if(answer == answerTwo){
        comparisonAnswer = Text("True");
      } else {
        comparisonAnswer = Text("False");
      }
      return comparisonAnswer;
    }
}