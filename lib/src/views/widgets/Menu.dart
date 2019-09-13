import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget{
  final String _title;

  MainMenu(this._title);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: Text(_title),
      ),
      body: TabBarMainMenu(),
    );
  }
}


class SecondMenu extends StatelessWidget{
  final String _title;

  SecondMenu(this._title);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: Text(_title),
      ),
      body: TabBarSecondMenu(),
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
