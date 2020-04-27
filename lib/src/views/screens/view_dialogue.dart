import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/models/dialogue_model.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class ViewDialoguePage extends StatefulWidget {
    ViewDialoguePage({
        Key key,
        this.dialogue
    }) : super(key: key);

    final Dialogue dialogue;

    @override
    _ViewDialoguePageState createState() => _ViewDialoguePageState();
}

class _ViewDialoguePageState extends State<ViewDialoguePage> {

    @override
    void initState() {
        super.initState();
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("dialogue ".toUpperCase() + widget.dialogue.idDialogue.toString()),
            ),
            body: SingleChildScrollView(
              child: Container(
                child                                                                                                                                                                                                                                                                                                                                                                                                                               : Column(
                  children: <Widget>[
                    TitleText(title: widget.dialogue.titleDialogue.split("//")[0].toUpperCase(), colorOne: Colors.blue, colorTwo: Colors.lightBlue),
                    Container(
                      child: Image(image: AssetImage(widget.dialogue.photoDialogue.toString()), width: 360.0, height: 180.0,),
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    ),
                    TitleText(title: widget.dialogue.titleDialogue.split("//")[1].toUpperCase(), colorOne: Colors.lightBlue, colorTwo: Colors.blue),
                    GenerateContentsDialogue(
                      contentsDe: widget.dialogue.textDialogueDe.toString(),
                      contentsMg: widget.dialogue.textDialogueMg.toString(),
                      persName: widget.dialogue.persName.toString(),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                            widget.dialogue.explDialogue.split("//")[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(12, 6, 12, 6),
                          ),
                          Container(
                            child: Text(widget.dialogue.explDialogue.split("//")[1]),
                            margin: EdgeInsets.fromLTRB(12, 6, 12, 6),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(4.0),
                        color: Color(0xff9bdee8),
                      ),
                    ),
                    LocalAudio(path: widget.dialogue.audioDialogue.toString()),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
              ),
            ),
        );
    }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    this.title,
    this.colorOne,
    this.colorTwo,
  }) : super(key: key);

  final String title;
  final Color colorOne;
  final Color colorTwo;


  @override
  Widget build(BuildContext context) {
    return Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: colorTwo, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0),
                  color: colorOne,
                ),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            );
  }
}


class GenerateContentsDialogue extends StatelessWidget{
  const GenerateContentsDialogue({
    Key key,
    this.contentsDe,
    this.contentsMg,
    this.persName,
  }) : super(key: key);

  final String contentsDe;
  final String contentsMg;
  final String persName;

  @override
  Widget build(BuildContext context) {
    List listContentsDe = contentsDe.split("//");
    List listContentsMg = contentsMg.split("//");
    List listPersName = persName.split("//");
    List<Widget> listWidgetsContentsDialogue = List<Widget>();

    for (var i = 0; i < listContentsDe.length; i++) {
      listWidgetsContentsDialogue.add(
        ViewMessageLooksLike(
          textde: listContentsDe[i].toString(),
          textmg: listContentsMg[i].toString(),
          persname: listPersName[i].toString(),
        )  
      );              
    }
    return Column(children: listWidgetsContentsDialogue);
  }
}

class ViewMessageLooksLike extends StatelessWidget{
  const ViewMessageLooksLike({
    Key key,
    this.textde,
    this.textmg,
    this.persname,
  }) : super(key: key);

  final String textde;
  final String textmg;
  final String persname;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child:  Text(
                persname.toUpperCase()+":",
                style: TextStyle(
                  color: Colors.yellow,
                )
              ),
            ),
            Container(
              child: Text(
                textde,
                style: TextStyle(
                  color: Colors.white,
                )
              ),
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
              alignment: Alignment.topLeft,
            ),
            Container(
              child: Text(
                textmg,
                style: TextStyle(
                  color: Colors.black45,
                )
              ),
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
              alignment: Alignment.topLeft,
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 4.0),
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
        ),
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 10.0)
      ); 
    }
}

class LocalAudio extends StatefulWidget {
  const LocalAudio({
    Key key,
    this.path,
  }) : super(key: key);

  final String path;

  @override
  _LocalAudioState createState() => _LocalAudioState();
}

class _LocalAudioState extends State<LocalAudio> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancedPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    initialPlayer();
  }

  void initialPlayer(){
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState((){
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState((){
      _position = p;
    });

  }

  String localFilePath;

  Widget _tab(List<Widget>children){
    return Column(
      children: <Widget>[
        Column(
          children: children
          .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
          .toList()
        )
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed){
    return ButtonTheme(
      minWidth: 50.0,
      child: Container(
        width: 150,
        height: 50,
        child: RaisedButton(
          child: Text(txt),
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          textColor: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget slider(){
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.blue,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      
      onChanged: (double value){
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      }
    );
  }

  Widget localAudio(){
    return _tab([
      _btn('play', () => audioCache.play(widget.path)),
      _btn('pause', () => advancedPlayer.pause()),
      _btn('stop', () => advancedPlayer.stop()),
      slider(),
    ]);
  }

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[localAudio()],
    );
  }
}