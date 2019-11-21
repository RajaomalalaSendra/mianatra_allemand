import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key key,
    this.title,
    this.child,
    this.length = 1,
  }) : super(key: key);

  final Text title;
  final Widget child;
  final int length;

 @override
  Widget build(BuildContext context) {
    Widget defaultScaffold = Text("");
    
    if(length==1){
      defaultScaffold = Scaffold(
              appBar: AppBar(
                title:title,
              ),
              body: child,
      );
    }

    return defaultScaffold;
  }
}