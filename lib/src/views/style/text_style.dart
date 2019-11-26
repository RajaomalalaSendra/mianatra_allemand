import 'package:flutter/material.dart';

class TextStyleForTitle extends StatelessWidget{
  TextStyleForTitle(this.title,this.color);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(color: color, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,));
  }

}