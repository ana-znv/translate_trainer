class Sentence {
  final int? id;
  final String nativeSentence;
  final String foreignSentence;

  const Sentence({
    this.id,
    required this.nativeSentence,
    required this.foreignSentence,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nativeSentence': nativeSentence,
      'foreignSentence': foreignSentence,
    };
  }

  factory Sentence.fromMap(Map<String, Object?> map) {
    return Sentence(
      id: map['id'] as int,
      nativeSentence: map['nativeSentence'] as String,
      foreignSentence: map['foreignSentence'] as String,
    );
  }

  @override
  String toString() {
    return 'Sentence{id: $id, nativeSentence: $nativeSentence, foreignSentence: $foreignSentence}';
  }
}
