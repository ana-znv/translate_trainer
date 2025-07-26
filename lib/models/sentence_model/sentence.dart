class Sentence {
  final int id;
  final String nativeSentence;
  final String foreignSentence;

  const Sentence({
    required this.id,
    required this.nativeSentence,
    required this.foreignSentence,
  });

  Map<String, Object?> toMap() {
    return {'id': id, 'nativeSentence': nativeSentence, 'foreignSentence': foreignSentence};
  }

  @override
  String toString() {
    return 'Sentence{id: $id, nativeSentence: $nativeSentence, foreignSentence: $foreignSentence}';
  }
}
