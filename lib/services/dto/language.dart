class Language {
  final String lang;
  const Language({required this.lang});

  Map<String, dynamic> toMap() {
    return {'lang': lang};
  }

  @override
  String toString() {
    return 'Language{lang: $lang}';
  }
}
