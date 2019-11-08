import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';
import 'package:flutter/material.dart';

class CaseTabBarMenu extends StatelessWidget{
  final String _title;
  final List _columnsTitle;
  final  _contentLists;
  final Map _examplesByCase;
  final String routeName;

  CaseTabBarMenu(this._title, this._columnsTitle, this._contentLists, this._examplesByCase, this.routeName);
  
  @override
  Widget build(BuildContext context) {
    ExtractArgumentsScreenMianatraAlemana mianatraAlemana = new ExtractArgumentsScreenMianatraAlemana(_title, _columnsTitle, _contentLists, _examplesByCase, routeName);
    
    return RaisedButton(
      child: Text(_title),
      onPressed: () {
        // When the user taps the button, navigate to the specific route
        // and provide the arguments as part of the RouteSettings.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => mianatraAlemana,
          ),
        );
      },
    );
  }
}

// A Widget that extracts the necessary arguments from the ModalRoute.
class ExtractArgumentsScreenMianatraAlemana extends StatelessWidget {
  final String routeName;
  final String _title;
  final List _columnsTitle;
  final _contentLists;
  final Map _examplesByCase;
  
  ExtractArgumentsScreenMianatraAlemana(this._title, this._columnsTitle, this._contentLists, this._examplesByCase, this.routeName);
  
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    TabBarMianatraAlemana tabMianatraAlemana = new TabBarMianatraAlemana(_title, _columnsTitle, _contentLists, _examplesByCase);

    return Scaffold(
      body: Center(
        child: tabMianatraAlemana,
      ),
    );
  }
}

// class for the vocabularies all the content of it
class ResearchVocabularies extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return TextField(
              decoration: InputDecoration(
                hintText: 'Search', 
              ),  
            );
  }
}
