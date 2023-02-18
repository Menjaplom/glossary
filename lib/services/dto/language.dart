class DtoLang {
  static const String name = 'DTO_Language';

  final String lang;
  const DtoLang({required this.lang});

  Map<String, dynamic> toMap() {
    return {'lang': lang};
  }

  @override
  String toString() {
    return 'Language{lang: $lang}';
  }
}
