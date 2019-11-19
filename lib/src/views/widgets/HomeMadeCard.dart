import 'package:flutter/material.dart';

class HomeMadeCard extends StatelessWidget {
  //adding constructor
  HomeMadeCard({this.title, this.button});

  final Text title;
  final Widget button;

  @override
  Widget build(BuildContext context){
    return Container(
      //adding bottom padding on card
      padding: EdgeInsets.only(bottom: 20.0),
      child:  Card(
        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.blue, style: BorderStyle.values[1]),
                  ),
        borderOnForeground: true,
        child: Container(
          //adding padding inside card
          padding: EdgeInsets.all(17.0),
          child: Column(
          children: <Widget>[
              // Text("I love Flutter"),
              // Icon(Icons.favorite)

              this.title,
              this.button,
            ]
          )
        )
        
      )
    );
  }
}


class HomeMadeOutLineButton extends StatelessWidget {
  
  final String _title;
  final Widget _menu;

  HomeMadeOutLineButton(this._title, this._menu);
  
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
          shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                  ),
          borderSide: BorderSide(
                    color: Colors.blue,
                  ),
          child: Text(
            _title,
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _menu,
              ),
            );
          }
        );
  }
}

class HomeMadeOutLineButtonNothing extends StatelessWidget {
  
  final String _title;

  HomeMadeOutLineButtonNothing(this._title);
  
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
          shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                  ),
          borderSide: BorderSide(
                    color: Colors.blue,
                  ),
          child: Text(
            _title,
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: (){}
        );
  }
}


class HomeMadeCardTwo extends StatelessWidget {
  final String _text;
  final String _title;
  final Widget _widget;

  HomeMadeCardTwo(this._text, this._title, this._widget);

  @override
  Widget build(BuildContext context) {
    return HomeMadeCard(
        title: Text(
          _text,
          style: TextStyle(color: Colors.blue),
        ),
        button: HomeMadeOutLineButton(_title, _widget),
      );
  }

}

class HomeMadeCardTwoNothing extends StatelessWidget {
  final String _text;
  final String _title;

  HomeMadeCardTwoNothing(this._text, this._title);

  @override
  Widget build(BuildContext context) {
    return HomeMadeCard(
        title: Text(
          _text,
          style: TextStyle(color: Colors.blue),
        ),
        button: HomeMadeOutLineButtonNothing(_title),
      );
  }

}


class HomeMadeCardDialogue extends StatelessWidget {
  
  const HomeMadeCardDialogue({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final Text text;
  final Image image;

  @override
  Widget build(BuildContext context) {
    
    return Card(
              child: Container(
                child: Column(children: <Widget>[
                  image,
                  text,
                ],)
              )
            );
  }
  
}