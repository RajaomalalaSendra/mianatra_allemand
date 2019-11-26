class Grammar {
  int idGram;
  int numSubMenu;
  String title;
  String subtitleGram;
  String photoGram;

  Grammar({
      this.idGram,
      this.numSubMenu,
      this.title,
      this.subtitleGram,
      this.photoGram,
  });

  Map<String, dynamic> toJson() {
    return {
      "id_gram": idGram,
      "num_sub_menu": numSubMenu,
      "title": title,
      "subtitle_gram": subtitleGram,
      "photo_gram": photoGram,
    };
  }


  // Create a Note from JSON data
  factory Grammar.fromJson(Map<String, dynamic> json) => Grammar(
              idGram: json["id_gram"],
              numSubMenu: json["num_sub_menu"],
              title: json[ "title"],
              subtitleGram: json["subtitle_gram"],
              photoGram: json["photo_gram"],
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$idGram,$numSubMenu,$title,$subtitleGram,$photoGram';
  }
}