import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row( children: <Widget>[
          Expanded(
          child: TextField(
          decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        FlatButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                    content: Container(
                  child: 
                  ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text("Malagasy to Deutch", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic)),
                          leading: CircleAvatar(
                                backgroundImage:  AssetImage("assets/images/mgde.png"),
                          ),
                        ),
                        ListTile(
                          title: Text("Deutch to Malagasy", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic)),
                          leading: CircleAvatar(
                                backgroundImage:  AssetImage("assets/images/demg.png"),
                          ),
                        ),
                      ],
                    ),
                  width: 8.0,
                  height: 115.0,
                  ),
                );
              },
              );
            },
            child: Icon(
              Icons.swap_horizontal_circle,
              color: Colors.blue
            ),
           ),
        ]),
        Expanded(
          child: child,
        )
      ]);
  }
}