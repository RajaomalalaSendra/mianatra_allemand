class Grammar {
  int idGram;
  int numSubMenu;
  String titleGram;
  String subtitleGram;
  String photoGram;

  Grammar({
      this.idGram,
      this.numSubMenu,
      this.titleGram,
      this.subtitleGram,
      this.photoGram,
  });

  Map<String, dynamic> toJson() {
    return {
      "id_gram": idGram,
      "num_sub_menu": numSubMenu,
      "title_gram": titleGram,
      "subtitle_gram": subtitleGram,
      "photo_gram": photoGram,
    };
  }


  // Create a Note from JSON data
  factory Grammar.fromJson(Map<String, dynamic> json) => Grammar(
              idGram: json["id_gram"],
              numSubMenu: json["num_sub_menu"],
              titleGram: json[ "title_gram"],
              subtitleGram: json["subtitle_gram"],
              photoGram: json["photo_gram"],
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$idGram,$numSubMenu,$titleGram,$subtitleGram,$photoGram';
  }
}