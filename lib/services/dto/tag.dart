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
