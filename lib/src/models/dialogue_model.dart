class Dialogue {
  int idDialogue;
  String photoDialogue;
  String textDialogueMg;
  String textDialogueDe;
  String titleDialogue;
  String explDialogue;
  String audioDialogue;
  String videoDialogue;

  Dialogue({
      this.idDialogue,
      this.photoDialogue,
      this.textDialogueMg,
      this.textDialogueDe,
      this.explDialogue,
      this.titleDialogue,
      this.audioDialogue,
      this.videoDialogue
  });

  Map<String, dynamic> toJson() {
    return {
      "id_dial": idDialogue,
      "photo_dial": photoDialogue,
      "title_dial": titleDialogue,
      "text_dial_de": textDialogueDe,
      "text_dial_mg": textDialogueMg,
      "expl_dial": explDialogue,
      "audio_dial": audioDialogue,
      "video_dial": videoDialogue
    };
  }


  // Create a Note from JSON data
  factory Dialogue.fromJson(Map<String, dynamic> json) => Dialogue(
          idDialogue: json["id_dial"],
          photoDialogue: json["photo_dial"],
          titleDialogue: json["title_dial"],
          textDialogueDe: json["text_dial_de"],
          textDialogueMg: json["text_dial_mg"],
          explDialogue: json["expl_dial"],
          audioDialogue: json["audio_dial"],
          videoDialogue: json["video_dial"]
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$idDialogue,$titleDialogue,$textDialogueDe,$textDialogueMg,$audioDialogue';
  }
}