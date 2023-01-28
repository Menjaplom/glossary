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

class WordTranslation {
  final String lang1;
  final String lang2;
  final String tag1;
  final String tag2;
  final String word1;
  final String word2;

  const WordTranslation(
      {required this.lang1,
      required this.lang2,
      required this.tag1,
      required this.tag2,
      required this.word1,
      required this.word2});

  Map<String, dynamic> toMap() {
    return {
      'lang1': lang1,
      'lang2': lang2,
      'tag1': tag1,
      'tag2': tag2,
      'word1': word1,
      'word2': word2
    };
  }

  @override
  String toString() {
    return 'WordTranslation{lang1: $lang1, lang2: $lang2, tag1: $tag1, tag2: $tag2, word1: $word1, word2: $word2}';
  }
}
