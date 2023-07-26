import 'package:google_place_autocomplete/models/models.dart';

class Prediction {
  final String? description;
  final String? id;

  final List<MatchedSubstrings>? matchedSubstrings;
  final String? placeId;
  final String? reference;

  final StructuredFormatting? structuredFormatting;
  final List<Terms>? terms;
  final List<String>? types;
  final String? lat;
  final String? lng;

  Prediction({
    this.description,
    this.id,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
    this.lat,
    this.lng,
  });

  factory Prediction.fromMap(Map<String, dynamic> map) {
    return Prediction(
      description: map['description'],
      id: map['id'],
      matchedSubstrings: map['matched_substrings'] != null
          ? List<MatchedSubstrings>.from(map['matched_substrings']
              ?.map((x) => MatchedSubstrings.fromMap(x)))
          : null,
      placeId: map['place_id'],
      reference: map['reference'],
      structuredFormatting: map['structured_formatting'] != null
          ? StructuredFormatting.fromMap(map['structured_formatting'])
          : null,
      terms: map['terms'] != null
          ? List<Terms>.from(map['terms']?.map((x) => Terms.fromMap(x)))
          : null,
      types: List<String>.from(map['types']),
      lat: map['lat'],
      lng: map['lng'],
    );
  }
}
