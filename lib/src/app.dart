import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/screens/home.dart';

class MianatraAlemanaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mianatra Alemana',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MianatraAlemanaHomePage(title: 'Mianatra Alemana'),
    );
  }
}