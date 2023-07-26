import 'package:google_place_autocomplete/models/models.dart';

class PlacesAutocompleteResponse {
  final List<Prediction>? predictions;
  final String? status;

  PlacesAutocompleteResponse({
    this.predictions,
    this.status,
  });

  factory PlacesAutocompleteResponse.fromMap(Map<String, dynamic> map) {
    return PlacesAutocompleteResponse(
      predictions: map['predictions'] != null
          ? List<Prediction>.from(
              map['predictions']?.map((x) => Prediction.fromMap(x)))
          : null,
      status: map['status'],
    );
  }
}
