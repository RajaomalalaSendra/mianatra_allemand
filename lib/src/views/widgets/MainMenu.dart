import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';

class MainMenuGrammar extends StatelessWidget{
  final String _title;

  MainMenuGrammar(this._title);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        title: Text(_title),
      ),
      body: TabBarMainMenuGrammar(),
    );
  }
}