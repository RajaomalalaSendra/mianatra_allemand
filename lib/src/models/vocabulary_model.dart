class Vocabulary {
  int idVoc;
  String wordDe;
  String wordMg;

  Vocabulary({
      this.wordDe,
      this.wordMg,
      this.idVoc
  });

  Map<String, dynamic> toJson() {
    return {
      'id_voc': idVoc,
      'word_de': wordDe,
      'word_mg': wordMg,
    };
  }


  // Create a Note from JSON data
  factory Vocabulary.fromJson(Map<String, dynamic> json) => Vocabulary(
        idVoc: json["id_voc"],
        wordDe: json["word_de"],
        wordMg: json["word_mg"],
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$idVoc,$wordDe,$wordMg';
  }
}