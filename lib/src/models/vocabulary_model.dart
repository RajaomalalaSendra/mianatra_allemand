class Vocabulary {
  int idVoc;
  int idType;
  String wordDe;
  String wordMg;
  String explDe;
  String explMg;

  Vocabulary({
      this.wordDe,
      this.wordMg,
      this.idVoc,
      this.explDe,
      this.explMg,
      this.idType
  });

  Map<String, dynamic> toJson() {
    return {
      'id_voc': idVoc,
      'word_de': wordDe,
      'word_mg': wordMg,
      'expl_de': explDe,
      'expl_mg': explMg,
      'id_type': idType
    };
  }


  // Create a Note from JSON data
  factory Vocabulary.fromJson(Map<String, dynamic> json) => Vocabulary(
        idVoc: json["id_voc"],
        wordDe: json["word_de"],
        wordMg: json["word_mg"],
        explDe: json["expl_de"],
        explMg: json["expl_mg"],
        idType: json["id_type"],
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$idVoc,$wordDe,$wordMg,$explDe,$explMg';
  }
}