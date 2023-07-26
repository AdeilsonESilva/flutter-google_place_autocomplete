class LatLng {
  final double latitude;
  final double longitude;

  LatLng(
    this.latitude,
    this.longitude,
  );

  factory LatLng.fromMap(Map<String, dynamic> map) {
    return LatLng(
      map['latitude']?.toDouble() ?? 0.0,
      map['longitude']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() => 'LatLng(latitude: $latitude, longitude: $longitude)';
}
