import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';
import 'package:mianatra_alemana/src/data/dataCases.dart';

class MianatraAlemanaHomePage extends StatefulWidget {
  MianatraAlemanaHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MianatraAlemanaHomePageState createState() => _MianatraAlemanaHomePageState();
}

class _MianatraAlemanaHomePageState extends State<MianatraAlemanaHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        title: Text('Mianatra Alemana'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A button that navigates to a named route that. The named route
            // extracts the arguments by itself.
             RiseButtonByCase("Nominatif", columnsTitle, contentListsNominatif, examplesOfNominatif, "/nominatif"),
             RiseButtonByCase("Accusatif", columnsTitle, contentListsAccusatif, examplesOfAccusatif, "/accusatif"),
          ],
        ),
      ),
    );
  }
}

class RiseButtonByCase extends StatelessWidget{
  final String _title;
  final List _columnsTitle;
  final  _contentLists;
  final List _examplesByCase;
  final String routeName;

  RiseButtonByCase(this._title, this._columnsTitle, this._contentLists, this._examplesByCase, this.routeName);

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
  final List _examplesByCase;
  
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
