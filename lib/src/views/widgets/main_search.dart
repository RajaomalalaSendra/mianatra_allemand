import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/default_scaffold.dart';

class NavigateToMainSearch extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return DefaultScaffold(
            widthLeading: 12.0,
            leading: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search vocabulary or verb or dialogue', 
                  ),
                ),
                FlatButton(
                  onPressed: (){

                  },
                  child: Text("Text"),
                )
              ],
            ),
        );
    }
}