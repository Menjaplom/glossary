class Word {
  final String lang;
  final String tag;
  final String word;
  final String description;

  const Word(
      {required this.lang,
      required this.tag,
      required this.word,
      required this.description});

  Map<String, dynamic> toMap() {
    return {'lang': lang, 'tag': tag, 'word': word, 'description': description};
  }

  @override
  String toString() {
    return 'Word{lang: $lang, tag: $tag, word: $word, description: $description}';
  }
}
