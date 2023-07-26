class Terms {
  final int? offset;
  final String? value;

  Terms({this.offset, this.value});

  factory Terms.fromMap(Map<String, dynamic> map) {
    return Terms(
      offset: map['offset']?.toInt(),
      value: map['value'],
    );
  }
}
