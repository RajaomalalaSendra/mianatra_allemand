import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/MainMenu.dart';
import 'package:mianatra_alemana/src/views/widgets/main_search.dart';

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
        leading: Icon(Icons.tab),
        title: Text('Mianatra Alemana'),
        actions: <Widget>[
                  FlatButton(
                    onPressed:  (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => NavigateToMainSearch(),
                        ),
                      );
                    },
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ],
      ),
      
      body: MainMenu(),
    );
  }
}