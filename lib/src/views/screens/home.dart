import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';

class MianatraAlemanaHomePage extends StatefulWidget {
  MianatraAlemanaHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MianatraAlemanaHomePageState createState() => _MianatraAlemanaHomePageState();
}

class _MianatraAlemanaHomePageState extends State<MianatraAlemanaHomePage> {
  List _columnsTitle = ["Masculin", "Feminin", "Neutre", "Pluriel"];
  var _contentListsNominatif = {
          "definit": [
              "der", "die", "das", "die"
          ],
          "indefinit": [
              "ein", "eine", "ein", "-"
          ],
          "negation": [
            "kein", "keine", "kein", "keine"
          ]
  };
  var _contentListsAccusatif = {
          "definit": [
              "den", "die", "das", "die"
          ],
          "indefinit": [
              "einen", "eine", "ein", "-"
          ],
          "negation": [
            "keinen", "keine", "kein", "keine"
          ]
    };

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
          
            body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [
                      
                      this.createCases("I/ Ny \"Nominatif\"", _contentListsNominatif),
                      this.createCases("II/ Ny \"Accusatif\"", _contentListsAccusatif),
                    ]
                  ),
              ),
          ),   
        );
  }

  Widget createCases(String name, var contentLists){
    MianatraAlemanaRowsAndColumns alemanaRows = new MianatraAlemanaRowsAndColumns();
    if(name == "I/ Ny \"Nominatif\""){
      Widget cases = Column(
        children: [
            SimpleTextSection(name),
            TextSection("1/ Famaritana", "- Ny fameno rehefa ao arinanan'ny matoanteny \"sein\" dia ampiasaina ny \"Nominatif\""),
            SimpleTextSection("- Ny teny rehetra rehefa entimilaza dia ampiasaina ny \"Nominatif\""),
            TextSection("2/ Ohatra", "a) Du bist mein Freund."),
            SimpleTextSection("b) Die Frau ist hiere."),

            alemanaRows.twoColumns("3/ Famintinana", _columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),
          ]
        );

        return cases;
    } else {
      Widget cases = Column(
        children: [
            SimpleTextSection(name),
            TextSection("1/ Famaritana", "- Ny fameno rehetra ao arinanan'ny matoanteny ankoatran'ny \"sein\" dia ampiasaina ny \"Accusatif\""),
            TextSection("2/ Ohatra", "a) Ich habe keine Freund."),
            SimpleTextSection("b) Ich bringe einen Slushell."),
            
            alemanaRows.twoColumns("3/ Famintinana", _columnsTitle),
            alemanaRows.contentColumn(contentLists["definit"]),
            alemanaRows.contentColumn(contentLists["indefinit"]),
            alemanaRows.contentColumn(contentLists["negation"]),
          ]
      );

      return cases;
    }
  }
}
