import 'package:flutter/material.dart';

class NavigateToMainSearch extends StatefulWidget {
  
  @override
  _NavigateToMainSearchState createState() => new _NavigateToMainSearchState();
}


class _NavigateToMainSearchState extends State<NavigateToMainSearch> {
    String result = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: TextField( 
              decoration: InputDecoration(
                hintText: 'Search...'
              ),
              onSubmitted: (String str){
                setState((){
                  result = str;
                  if( result == "") result = "No answer";
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  TestResult(title: result, child: Text(result)),
                      ),
                  );
                });
              },
              style: TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.blue
            )
            ),
        );
    }
}

class TestResult extends StatelessWidget {
  
  const TestResult({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Container(
          child: Row(
            children: <Widget>[
              Icon(Icons.find_in_page),
              child
            ],
          ),
        ),
      ),
    );
  }
}