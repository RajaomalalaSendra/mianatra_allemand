import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RoutesAndTabs.dart';
import 'package:mianatra_alemana/src/views/widgets/HomeMadeCard.dart';


class HomeMenuSizeBoxDialogues extends StatelessWidget{
    final String _title;

    HomeMenuSizeBoxDialogues(this._title);

    Widget build(BuildContext context){
      return HomeMadeCardTwoNothing("Learn The Dialogues\n in German", _title);
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
    final Map _contentMaps;

    SecondMenuSizeBoxCases(this._title, this._contentMaps);


    Widget build(BuildContext context){
      TabBarMianatraAlemana tabBarMianatraAlemana = new TabBarMianatraAlemana(_title, _contentMaps);
      List columnsTitle = _contentMaps["columnsTitle"];

      for (var i = 0; i < columnsTitle.length; i++){
        return HomeMadeCardTwo("Apprendre le \n cas " + _title,_title, tabBarMianatraAlemana);
      }
      return Text("OK");
  }
}