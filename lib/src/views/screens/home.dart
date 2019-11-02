import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/MainMenu.dart';

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
      
      body: MainMenu(),
    );
  }
}
