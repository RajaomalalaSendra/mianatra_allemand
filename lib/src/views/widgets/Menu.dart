import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';
import 'package:flutter/material.dart';

class CaseTabBarMenu extends StatelessWidget{
  final String _title;
  final Map _contentMaps;

  CaseTabBarMenu(this._title, this._contentMaps);
  
  @override
  Widget build(BuildContext context) {
    ExtractArgumentsScreenMianatraAlemana mianatraAlemana = new ExtractArgumentsScreenMianatraAlemana(_title, _contentMaps);
    
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
  final Map _contentMaps;
  final String _title;
  
  ExtractArgumentsScreenMianatraAlemana(this._title, this._contentMaps);
  
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    TabBarMianatraAlemana tabMianatraAlemana = new TabBarMianatraAlemana(_title, _contentMaps);

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
