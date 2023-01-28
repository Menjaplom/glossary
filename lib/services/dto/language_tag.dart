class Tag {
  final String lang;
  final String tag;

  const Tag({required this.lang, required this.tag});

  Map<String, dynamic> toMap() {
    return {'lang': lang, 'tag': tag};
  }

  @override
  String toString() {
    return 'Tag{lang: $lang, tag: $tag}';
  }
}

class TagTranslation {
  final String lang1;
  final String lang2;
  final String tag1;
  final String tag2;

  const TagTranslation(
      {required this.lang1,
      required this.lang2,
      required this.tag1,
      required this.tag2});

  Map<String, dynamic> toMap() {
    return {'lang1': lang1, 'lang2': lang2, 'tag1': tag1, 'tag2': tag2};
  }

  @override
  String toString() {
    return 'TagTranslation{lang1: $lang1, lang2: $lang2, tag1: $tag1, tag2: $tag2}';
  }
}
