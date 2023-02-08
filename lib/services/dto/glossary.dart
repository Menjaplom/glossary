class LangsGlossary {
  final String lang1;
  final String lang2;
  final int lastView;
  final bool langOrder;

  const LangsGlossary(
      {required this.lang1,
      required this.lang2,
      required this.lastView,
      required this.langOrder});

  Map<String, dynamic> toMap() {
    return {
      'lang1': lang1,
      'lang2': lang2,
      'last_view': lastView,
      'lang_order': langOrder
    };
  }

  @override
  String toString() {
    return 'LangGlossary{lang1: $lang1, lang2: $lang2, last_view: $lastView, lang_order: $langOrder}';
  }
}
