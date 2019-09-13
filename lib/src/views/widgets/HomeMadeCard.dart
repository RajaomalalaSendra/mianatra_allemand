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
      child: Card(
        child: Container(
          //adding padding inside card
          padding: EdgeInsets.all(15.0),
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
                    color: Colors.lightGreen,
                  ),
          child: Text(
            _title,
            style: TextStyle(color: Colors.lightGreen),
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
                    color: Colors.lightGreen,
                  ),
          child: Text(
            _title,
            style: TextStyle(color: Colors.lightGreen),
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
          style: TextStyle(color: Colors.lightGreen),
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
          style: TextStyle(color: Colors.lightGreen),
        ),
        button: HomeMadeOutLineButtonNothing(_title),
      );
  }

}