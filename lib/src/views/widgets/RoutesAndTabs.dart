import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';

class TabBarMianatraAlemana extends StatelessWidget {
  final Map _contentMaps;
  final String _title;

  TabBarMianatraAlemana(this._title, this._contentMaps);


 @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: this.appBarByCase(),
              body: TabBarView(
                        children: [
                          createTab(createCases()),
                          createTab(TextInputByCase(_title)),
                        ],
                      ),
                  ),
    );
  }

  Widget createCases(){
    MianatraAlemanaRowsAndColumns alemanaRows = new MianatraAlemanaRowsAndColumns();
    List columnsTitle = _contentMaps["ColumnsTitle"];
    Map contentLists = _contentMaps["Deutch"][_title]["contentLists"];
    if(_title == "Nominatif"){
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehefa ao arinanan'ny matoanteny \"sein\" dia ampiasaina ny \"Nominatif\""),
            SimpleTextSection("- Ny teny rehetra rehefa entimilaza dia ampiasaina ny \"Nominatif\""),

            alemanaRows.twoColumns("2/ Famintinana", columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),

            TextSection("Ohatra Voalohany", _contentMaps["Deutch"][_title]["one"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"][_title]["one"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"][_title]["one"], _contentMaps["Malagasy"][_title]["one"]),
           
           
            TextSection("3/ Nominatif miaraka amin'ny adjectif", "-  Ny adjectif ihany koa rehefa eo alohan'ny teny \nanankiray dia manaraka ny genre sy ny isany"),
            SimpleTextSection("Sahala amin'izao no fampiasana azy:\n article + adjectif miafara amin'ilay genre ny article + anarana iombonana."),

            alemanaRows.twoColumns("2/ Teny Miafara ao anatin'ny adjectif", columnsTitle),
            alemanaRows.contentColumn(["r na er", "e", "es", "e"]),

            TextSection("Ohatra faharoa miaraka amin'ny adjectif", _contentMaps["Deutch"]["Nominatif"]["two"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Nominatif"]["two"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Nominatif"]["two"], _contentMaps["Malagasy"]["Nominatif"]["two"]),

          ]
      );
        return cases;
    } else if(_title == "Accusatif") {
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehetra ao arinanan'ny matoanteny ankoatran'ny \"sein\" dia ampiasaina ny \"Accusatif\""),
            
            alemanaRows.twoColumns("2/ Famintinana", columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),

            TextSection("Ohatra Voalohany", _contentMaps["Deutch"]["Accusatif"]["one"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Accusatif"]["one"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Accusatif"]["one"], _contentMaps["Malagasy"]["Accusatif"]["one"]),

            TextSection("Ohatra faharoa miaraka amin'ny adjectif", _contentMaps["Deutch"]["Accusatif"]["two"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Accusatif"]["two"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Accusatif"]["two"], _contentMaps["Malagasy"]["Accusatif"]["two"]),
          ]
      );

      return cases;
    } else if(_title == "Datif") {
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehetra ao arinanan'ny matoanteny ankoatran'ny \"sein\" dia ampiasaina ny \"Accusatif\""),
            
            alemanaRows.twoColumns("2/ Famintinana", columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),

            TextSection("Ohatra Voalohany", _contentMaps["Deutch"]["Datif"]["one"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Datif"]["one"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Datif"]["one"], _contentMaps["Malagasy"]["Datif"]["one"]),

            TextSection("Ohatra faharoa miaraka amin'ny adjectif", _contentMaps["Deutch"]["Datif"]["two"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Datif"]["two"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Datif"]["two"], _contentMaps["Malagasy"]["Datif"]["two"]),
          ],
      );

      return cases;
    } else {
      Widget cases = Column(
        children: [
            TextSection("1/ Famaritana", "- Ny fameno rehetra ao arinanan'ny matoanteny ankoatran'ny \"sein\" dia ampiasaina ny \"Accusatif\""),
            
            alemanaRows.twoColumns("2/ Famintinana", columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),

            TextSection("Ohatra Voalohany", _contentMaps["Deutch"]["Genetif"]["one"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Genetif"]["one"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Genetif"]["one"], _contentMaps["Malagasy"]["Genetif"]["one"]),

            TextSection("Ohatra faharoa miaraka amin'ny adjectif", _contentMaps["Deutch"]["Genetif"]["two"][0]),
            SimpleTextSection(">> " + _contentMaps["Malagasy"]["Genetif"]["two"][0]),
            contentDetailExampleCases(_contentMaps["Deutch"]["Genetif"]["two"], _contentMaps["Malagasy"]["Genetif"]["two"]),
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
                      Tab(icon: Icon(Icons.border_color),
                      text: "Fampiharana"),
                    ],
                ),
              );
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

// class TabBarHomeMenu  extends StatelessWidget {

//   Widget build(BuildContext context){
//     return   Scaffold(
//       body: 
//           Column(
//             children: <Widget>[
//               Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                   HomeMenuSizeBoxGrammar("Grammaire"),
//                   HomeMenuSizeBoxVocabularies("Vocabulaire"),
//               ],
//           ), 
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                   HomeMenuSizeBoxDialogues("Dialogues"),
//                   HomeMenuSizeBoxDialogues("Dialogues II"),
//               ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TabBarMainMenuGrammar  extends StatelessWidget {

//   Widget build(BuildContext context){
//     return   Scaffold(
//       body: 
//           Column(
//             children: <Widget>[
//               Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                   MainMenuSizeBoxCases("Cas"),
//                   MainMenuSizeBoxConjugaison("Conjugaison"),
//               ],
//           ), 
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 MainMenuSizeBoxTexts("Textes"),
//           ],)
//         ],
//       ),
//     );
//   }
// }

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

// class TabBarSecondMenuCases extends StatelessWidget {  

//   Widget build(BuildContext context){
//     return   Scaffold(
//       body: 
//           Column(
//             children: <Widget>[
//               Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                   SecondMenuSizeBoxCases("Nominatif", columnsTitle, contentLists[0], _contentMapss),
//                   SecondMenuSizeBoxCases("Accusatif", columnsTitle, contentLists[1], _contentMapss),
//               ],
//           ), 
//         ],
//       ),
//     );
//   }
// }

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