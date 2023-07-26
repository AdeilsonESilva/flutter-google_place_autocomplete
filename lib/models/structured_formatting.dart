class StructuredFormatting {
  final String? mainText;
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromMap(Map<String, dynamic> map) {
    return StructuredFormatting(
      mainText: map['main_text'],
      secondaryText: map['secondary_text'],
    );
  }
}
