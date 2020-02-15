class Conjugaison {
  int idVerb;
  int idGroupVerb;
  String verb;
  String presentInd;
  String participe;
  String pastInd;
  String futureInd;

  Conjugaison({
      this.idVerb,
      this.idGroupVerb,
      this.verb,
      this.presentInd,
      this.participe,
      this.pastInd,
      this.futureInd
  });

  Map<String, dynamic> toJson() {
    return {
      "id_verb": idVerb,
      "id_group_verb": idGroupVerb,
      "present_ind": presentInd,
      "verb": verb,
      "future_ind": futureInd,
      "past_ind": pastInd,
      "participe": participe
    };
  }


  // Create a Note from JSON data
  factory Conjugaison.fromJson(Map<String, dynamic> json) => Conjugaison(
          idVerb: json["id_verb"],
          idGroupVerb: json["id_group_verb"],
          verb: json["verb"],
          presentInd: json["present_ind"],
          futureInd: json["future_ind"],
          pastInd: json["past_ind"],
          participe: json["participe"]
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$idVerb,$idGroupVerb,$futureInd,$presentInd,$pastInd,$participe,$idGroupVerb';
  }
}