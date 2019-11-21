import 'package:flutter/material.dart';
import 'package:mianatra_alemana/src/views/widgets/RowsAndColumns.dart';

class DetailDialogue extends StatelessWidget {
  
  const DetailDialogue({
    Key key,
    this.color = const Color(0xFF2DBD3A),
    this.child,
    this.image,
    this.mapContentDialogue,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final AssetImage image;
  final Map mapContentDialogue;

  @override
  Widget build(BuildContext context) {
    
    Widget detailDialogue = new Text("");

    detailDialogue = Column(children: <Widget>[
        Image(image: image, width: 140.0, height: 70.0),
        VeryDetailDialogue(mapContent: mapContentDialogue["dialogues"]),
        VocabularyToRemember(mapContent: mapContentDialogue["vocabularies"]),
        FooterDetailDialogue(),
    ]);
    
    return detailDialogue;
  }
  
}

class VocabularyToRemember extends StatelessWidget {
  
  const VocabularyToRemember({
    Key key,
    this.mapContent,
  }) : super(key: key);

  final Map mapContent;

  @override
  Widget build(BuildContext context) {
    List<Widget> listVocabularyToRemember = new List<Widget>();
    
    for (var i = 0; i < mapContent["titles"].length; i++) {
      listVocabularyToRemember.add(
        SimpleTextSectionVocabulary(
          child: Text(mapContent["titles"][i] + "  =>> " + mapContent["explanation"][i]),
          color: Color(0xffdbf5ff),
        )
      );
    }
    return Column(children: listVocabularyToRemember);
  }
}

class VeryDetailDialogue extends StatelessWidget {
  
  const VeryDetailDialogue({
    Key key,
    this.mapContent,
  }) : super(key: key);

  final Map mapContent;

  @override
  Widget build(BuildContext context) {
    List<Widget> listVeryDetailDialogue = new List<Widget>();
    
    for (var i = 0; i < mapContent["deutch"].length; i++) {
      listVeryDetailDialogue.add(
        SimpleTextSectionVocabulary(
          child: Text(mapContent["deutch"][i] + "  =>> " + mapContent["malagasy"][i]),
          color: Color(0xffdbf5ff),
        )
      );
    }
    return Column(children: listVeryDetailDialogue);
  }
}

class FooterDetailDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("Footer Dialogue"),
    ],);
  }
}