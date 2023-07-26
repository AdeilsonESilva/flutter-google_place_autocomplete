class MatchedSubstrings {
  final int? length;
  final int? offset;

  MatchedSubstrings({this.length, this.offset});

  factory MatchedSubstrings.fromMap(Map<String, dynamic> map) {
    return MatchedSubstrings(
      length: map['length']?.toInt(),
      offset: map['offset']?.toInt(),
    );
  }
}
