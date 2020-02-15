import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    Key key,
    this.title,
    this.child,
    this.leading,
    this.widthLeading,
    this.length = 1,
  }) : super(key: key);

  final Widget title;
  final Widget child;
  final Widget leading;
  final double widthLeading;
  final int length;

 @override
  Widget build(BuildContext context) {
   
   return Scaffold(
              appBar: AppBar(
                title: title,
                leading: Container(
                  child: leading,
                  width: widthLeading,
                )
              ),
              body: child,
      );
    }
}