import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/MainMenu.dart';
import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';
import 'package:mianatra_alemana/src/views/widgets/SecondMenu.dart';
import 'package:mianatra_alemana/src/views/widgets/HomeMadeCard.dart';

class HomeMenuSizeBoxGrammar extends StatelessWidget{
    final String _title;

    HomeMenuSizeBoxGrammar(this._title);

    Widget build(BuildContext context){
      return HomeMadeCardTwo("Learn The Grammar\n in German", _title, MainMenuGrammar(_title));
    }
}

class HomeMenuSizeBoxVocabularies extends StatelessWidget{
    final String _title;

    HomeMenuSizeBoxVocabularies(this._title);

    Widget build(BuildContext context){
      return  HomeMadeCardTwo("Learn Vocabularies \n German", _title, MainMenuVocabularies(_title));
    }
}

class HomeMenuSizeBoxDialogues extends StatelessWidget{
    final String _title;

    HomeMenuSizeBoxDialogues(this._title);

    Widget build(BuildContext context){
      return HomeMadeCardTwoNothing("Learn The Dialogues\n in German", _title);
    }
}

class MainMenuSizeBoxCases extends StatelessWidget{
    final String _title;

    MainMenuSizeBoxCases(this._title);


    Widget build(BuildContext context){  
      return HomeMadeCardTwo("Learn The Cases\n in German",_title, SecondMenuCases(_title));
    }
}

class MainMenuSizeBoxConjugaison extends StatelessWidget {
  final String _title;

  MainMenuSizeBoxConjugaison(this._title);
  
  @override
  Widget build(BuildContext context) {
    return HomeMadeCardTwoNothing("Apprendre \nLa Conjugaison", _title);
  }
}
class MainMenuSizeBoxTexts extends StatelessWidget{
  
  final String _title;

  MainMenuSizeBoxTexts(this._title);
  
  @override
  Widget build(BuildContext context) {
    return HomeMadeCardTwoNothing("Lesen Einen\n Texts", _title);
  }
}

class SecondMenuSizeBoxCases extends StatelessWidget{
    final String _title;
    final List _columnsTitle;
    final _contentLists;
    final List _examplesByCase;

    SecondMenuSizeBoxCases(this._title, this._columnsTitle, this._contentLists, this._examplesByCase);


    Widget build(BuildContext context){
      TabBarMianatraAlemana tabBarMianatraAlemana = new TabBarMianatraAlemana(_title, _columnsTitle, _contentLists, _examplesByCase);
      for (var i = 0; i < _columnsTitle.length; i++){
        return HomeMadeCardTwo("Apprendre le \n cas " + _title,_title, tabBarMianatraAlemana);
      }
      return Text("OK");
  }
}
