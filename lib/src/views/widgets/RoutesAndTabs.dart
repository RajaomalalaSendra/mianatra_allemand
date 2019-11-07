import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';
import 'package:mianatra_alemana/src/views/widgets/SizeBox.dart';
import 'package:mianatra_alemana/src/data/dataCases.dart';

class TabBarMianatraAlemana extends StatelessWidget {
  final  String _title;
  final List _columnsTitle;
  final _contentLists;
  final Map _examplesByCase;

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
                          this.createTab(TextInputByCase(_title)),
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
    } else if(_title == "Accusatif") {
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
    } else if(_title == "Datif") {
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehetra ao arinanan'ny matoanteny ankoatran'ny \"sein\" dia ampiasaina ny \"Accusatif\""),
            
            alemanaRows.twoColumns("2/ Famintinana", _columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),
          ],
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
          ],
      );

      return cases;
    }
  }

  Widget appBarByCase(){
    return  AppBar(
                title: TabBar(
                  isScrollable: true,
                  tabs: [
                      Tab(icon: Icon(Icons.library_books),
                      text: "Lesona"),
                      Tab(icon: Icon(Icons.book),
                      text: "Ohatra"),
                      Tab(icon: Icon(Icons.border_color),
                      text: "Fampiharana"),
                    ],
                ),
              );
  }

  Widget createExamplesByCase(Map examplesByCase){
    /// create example by case
    /// And you can check the documentation here
    Widget column = Column(); 

    if(_title == "Nominatif"){
      column = Column(
        children:[
            TextSection("Ohatra Voalohany", examplesByCase["Deutch"]["Nominatif"]["one"][0]),
            SimpleTextSection(">> " + examplesByCase["Malagasy"]["Nominatif"]["one"][0]),
            contentDetailExampleCases(examplesByCase["Deutch"]["Nominatif"]["one"], examplesByCase["Malagasy"]["Nominatif"]["one"]),

            TextSection("Ohatra faharoa miaraka amin'ny adjectif", examplesByCase["Deutch"]["Nominatif"]["two"][0]),
            SimpleTextSection(">> " + examplesByCase["Malagasy"]["Nominatif"]["two"][0]),
            contentDetailExampleCases(examplesByCase["Deutch"]["Nominatif"]["two"], examplesByCase["Malagasy"]["Nominatif"]["two"]),
        ],
    );
    } else if(_title == "Accusatif"){
      column = Column(
            children:[
              TextSection("Ohatra Voalohany", examplesByCase["Deutch"]["Accusatif"]["one"][0]),
              SimpleTextSection(">> " + examplesByCase["Malagasy"]["Accusatif"]["one"][0]),
              contentDetailExampleCases(examplesByCase["Deutch"]["Accusatif"]["one"], examplesByCase["Malagasy"]["Accusatif"]["one"]),

              TextSection("Ohatra faharoa miaraka amin'ny adjectif", examplesByCase["Deutch"]["Accusatif"]["two"][0]),
              SimpleTextSection(">> " + examplesByCase["Malagasy"]["Accusatif"]["two"][0]),
              contentDetailExampleCases(examplesByCase["Deutch"]["Accusatif"]["two"], examplesByCase["Malagasy"]["Accusatif"]["two"]),
            ],
        );
    } else if(_title == "Datif"){
      column = Column(
        children:[
              TextSection("Ohatra Voalohany", examplesByCase["Deutch"]["Datif"]["one"][0]),
              SimpleTextSection(">> " + examplesByCase["Malagasy"]["Datif"]["one"][0]),
              contentDetailExampleCases(examplesByCase["Deutch"]["Datif"]["one"], examplesByCase["Malagasy"]["Datif"]["one"]),

              TextSection("Ohatra faharoa miaraka amin'ny adjectif", examplesByCase["Deutch"]["Datif"]["two"][0]),
              SimpleTextSection(">> " + examplesByCase["Malagasy"]["Datif"]["two"][0]),
              contentDetailExampleCases(examplesByCase["Deutch"]["Datif"]["two"], examplesByCase["Malagasy"]["Datif"]["two"]),
        ],
    );
    } else {
      column = Column(
        children:[
              TextSection("Ohatra Voalohany", examplesByCase["Deutch"]["Genetif"]["one"][0]),
              SimpleTextSection(">> " + examplesByCase["Malagasy"]["Genetif"]["one"][0]),
              contentDetailExampleCases(examplesByCase["Deutch"]["Genetif"]["one"], examplesByCase["Malagasy"]["Genetif"]["one"]),

              TextSection("Ohatra faharoa miaraka amin'ny adjectif", examplesByCase["Deutch"]["Genetif"]["two"][0]),
              SimpleTextSection(">> " + examplesByCase["Malagasy"]["Genetif"]["two"][0]),
              contentDetailExampleCases(examplesByCase["Deutch"]["Genetif"]["two"], examplesByCase["Malagasy"]["Genetif"]["two"]),
        ],
    );
    }
    return column;
  }

  Widget contentDetailExampleCases(List<String> examplesDeutch, List<String> examplesMalagasy){
    List<Widget> listWidgetsExamples = new List<Widget>();
    for (var i = 0; i < examplesMalagasy.length; i++) {
      if(i != 0){
        listWidgetsExamples.add(
          SimpleTextSection(examplesDeutch[i] + "\n\n>> " + examplesMalagasy[i])
        );
      }
    }
    return Column(children: listWidgetsExamples);
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
                  SecondMenuSizeBoxCases("Nominatif", columnsTitle, contentLists[0], examplesByCases),
                  SecondMenuSizeBoxCases("Accusatif", columnsTitle, contentLists[1], examplesByCases),
              ],
          ), 
        ],
      ),
    );
  }
}

class TextInputByCase extends StatefulWidget {
  final String _title;

  TextInputByCase(this._title);

  @override
  _CreateExercicesByCase createState() => new _CreateExercicesByCase(_title);
}

class _CreateExercicesByCase extends State<TextInputByCase>{
    final String _title;
    String result = "";

    _CreateExercicesByCase(this._title);

    @override
    Widget build(BuildContext context){
      Widget column = Column();
      String hintTextOne = "der/die/das";
      String hintTextTwo = "den/die/das";


      if(_title == "Nominatif"){
          column = Column (
                children: <Widget>[
                  rowConstrainedBoxByCase("Das ist die frau", "Frau ist Frau,", "die", hintTextOne),
                  rowConstrainedBoxByCase("Du bist ", "Lehrer", "der", hintTextOne),
                  rowConstrainedBoxByCase("Sie sind", "Studenten", "die", hintTextOne),
                ],
          );
      } else if(_title == "Accusatif"){
        column = Column (
              children: <Widget>[
                rowConstrainedBoxByCase("Deine Frau hast", "Bruder", "den", hintTextTwo),
                rowConstrainedBoxByCase("Dein Lehrer isst ", "Apfel", "das", hintTextTwo),
                rowConstrainedBoxByCase("Sie sind", "Studenten", "die", hintTextOne),
              ],
        );
      } else if(_title == "Datif"){
          column = Column (
              children: <Widget>[
                rowConstrainedBoxByCase("Das ist die frau", "Frau ist Frau,", "die", hintTextOne),
                rowConstrainedBoxByCase("Du bist ", "Lehrer", "der", hintTextOne),
                rowConstrainedBoxByCase("Sie sind", "Studenten", "die", hintTextOne),
              ],
        );
      } else {
        column = Column (
              children: <Widget>[
                rowConstrainedBoxByCase("Das ist die frau", "Frau ist Frau,", "die", hintTextOne),
                rowConstrainedBoxByCase("Du bist ", "Lehrer", "der", hintTextOne),
                rowConstrainedBoxByCase("Sie sind", "Studenten", "die", hintTextOne),
              ],
        );
      }

      return column;

    }

    Widget rowConstrainedBoxByCase(String textOne, String textTwo, String theanswer, String theHintText){
      return Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  constrainedBoxByCase(textOne, textTwo, theanswer, theHintText),  
                ],
              );
    }
    
    Widget constrainedBoxByCase(String textOne, String textTwo, String theanswer, String theHintText){
      return ConstrainedBox(
                  constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width),
                  child:  Container(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Row( 
                      children: <Widget>[
                          Flexible(
                            child: Text(
                              textOne,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Flexible(
                            child: Container(
                                width: 100.0,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: theHintText,
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
                              ),
                          ),
                         Flexible(
                            child: Text(textTwo),
                          ),
                          //displaying input text
                          computeComparisonAnswer(result, theanswer),                      
                      ]),
                      ),
                  ),
        );
    }

    Widget computeComparisonAnswer(String answer, String answerTwo){
      Widget comparisonAnswer = Text("...");
      
      if(answer == answerTwo){
        comparisonAnswer = Text("True");
      } else {
        comparisonAnswer = Text("False");
      }
      return comparisonAnswer;
    }
}