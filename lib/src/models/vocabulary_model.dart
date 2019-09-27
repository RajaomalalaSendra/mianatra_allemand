class Vocabulary {
  int id;
  String deword;
  String mgword;

  Vocabulary({
      this.deword,
      this.mgword,
      this.id
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deword': deword,
      'mgword': mgword,
    };
  }


  // Create a Note from JSON data
  factory Vocabulary.fromJson(Map<String, dynamic> json) => Vocabulary(
        id: json["id"],
        deword: json["deword"],
        mgword: json["mgword"],
  );

  // Implement toString to make it easier to see information about
  // each vocabularies when using the print statement.
  @override
  String toString() {
    return '$id,$deword,$mgword';
  }
}