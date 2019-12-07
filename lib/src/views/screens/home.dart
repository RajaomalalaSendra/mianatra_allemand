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
        leading: PopupMenuButton(
                    itemBuilder: (BuildContext context){
                      return [
                        PopupMenuItem(
                          child: FlatButton(
                            child: Text("Test is here"),
                            onPressed: (){
                              clicked(context, "Email send really");
                            }
                          )
                        ),
                        PopupMenuItem(
                          child: FlatButton(
                            child: Text("Test is here"),
                            onPressed: (){
                              clicked(context, "Email send really");
                            }
                          )
                        ),
                      ];
                    },
                    child: Icon(Icons.menu, color: Colors.white,)
                  ),
        title: Text('Mianatra Alemana'),
        actions: <Widget>[
                  IconButton(
                    onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  NavigateToMainSearch(),
                          ),
                        );
                    },
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                  PopupMenuButton(
                    itemBuilder: (BuildContext context){
                      return [
                        PopupMenuItem(
                          child: FlatButton(
                            child: Text("Test is here"),
                            onPressed: (){
                              clicked(context, "Email send really");
                            }
                          )
                        ),
                        PopupMenuItem(
                          child: FlatButton(
                            child: Text("Test is here"),
                            onPressed: (){
                              clicked(context, "Email send really");
                            }
                          )
                        ),
                      ];
                    },
                  ),
                ],
      ),
      
      body: MainMenu(),
    );
  }

  void clicked(BuildContext context, menu){
    final scaffold = Scaffold.of(context);

    scaffold.showSnackBar(
      SnackBar(
      content: Text(menu),
      action: SnackBarAction(
        label: "Undo",
        onPressed: scaffold.hideCurrentSnackBar,)
      ),
    );
  }
}