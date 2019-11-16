import 'package:flutter/material.dart';

class MianatraAlemanaRowsAndColumns {
  static const double _padding = 16.0; 
   
   Widget twoRows(String textOne, String textTwo){
       double length = 15.0;
       return Row( children: <Widget>[
          this.expandedRow(length, textOne),
          this.expandedRow(length, textTwo)
      ],
    );
   }

   Widget fourRows(String textOne, String textTwo, String textThree, String textFour){
       double length = 7.5;
       List textList = [textOne, textTwo, textThree, textFour];

       return Row( children: <Widget>[
          this.expandedRow(length, textList[0]),
          this.expandedRow(length, textList[1]),
          this.expandedRow(length, textList[2]),
          this.expandedRow(length, textList[3])  
       ]
    );
   }

  Widget twoColumns(String title, List texts){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          padding: const EdgeInsets.fromLTRB(_padding, 32.0, _padding, 4.0),
          child: Text(title),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          padding: const EdgeInsets.fromLTRB(_padding, 10.0, _padding, _padding),
          child: this.fourRows(texts[0], texts[1], texts[2], texts[3]),
        )
      ]
    );
  }

  Widget contentColumn(List texts){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(
              color:  Colors.black,
              width: 0.5,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(_padding, 10.0, _padding, _padding),
          child: this.fourRows(texts[0], texts[1], texts[2], texts[3]),
        )
      ],
    );
  }

  Widget expandedRow(double length, String text){
    return Expanded(
            child: Container(
              padding: EdgeInsets.all(length),
              child: Text(text)
            )); 
  } 
}

class TextSection extends StatelessWidget {
  final _title;
  final _body;
  static const double _padding = 16.0;

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          padding: const EdgeInsets.fromLTRB(_padding, 32.0, _padding, 4.0),
          child: Text(_title),
        ),
        
        Container(
          decoration: BoxDecoration(
            color: Colors.white30,
          ),
          padding: const EdgeInsets.fromLTRB(_padding, 10.0, _padding, _padding),
          child: Text(_body),
        )
      ],
    );
  }
}

class SimpleTextSection extends StatelessWidget {
  final _body;
  static const double _padding = 16.0;

  SimpleTextSection(this._body);

  @override
  Widget build(BuildContext context) {
    var getDecoration;

    if (_body.length < 20){
      getDecoration = BoxDecoration(
            color: Colors.white70,
      );
    } else {
      getDecoration = BoxDecoration(
            color: Colors.white24,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Container(
          decoration: getDecoration,
          padding: const EdgeInsets.fromLTRB(_padding, 10.0, _padding, _padding),
          child: Text(_body),
        )
      ],
    );
  }
}


class Frog extends StatelessWidget {
  const Frog({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, child: child);
  }
}


class SimpleTextSectionVocabulary  extends StatelessWidget{
  const SimpleTextSectionVocabulary({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;
  static const double _padding = 16.0;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: color,
          ),
          padding: const EdgeInsets.fromLTRB(_padding, 10.0, _padding, _padding),
          child: child,
        )
      ],
    );
  }
}