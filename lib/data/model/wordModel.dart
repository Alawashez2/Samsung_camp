class Word {
  final String word;
  final double similarity;

  Word({required this.word, required this.similarity});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] ,
      similarity: json['similarity'] ,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['word'] = word;
  //   data['similarity'] = similarity;
  //   return data;
  // }
}
