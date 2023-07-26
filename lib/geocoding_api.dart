import 'dart:async';
import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/models/models.dart';

class PlacesService {
  final Dio _dio;

  PlacesService._(this._dio);

  factory PlacesService.create() {
    return PlacesService._(Dio());
  }

  String get apiKey => "";

  Future<PlacesAutocompleteResponse> getPlaces(String term) async {
    print(term);
    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$term&key=$apiKey&language=pt-BR&components=country:br";
    final response = await _dio.get<Object>(url);
    final placeResult = PlacesAutocompleteResponse.fromMap(
        response.data as Map<String, dynamic>);
    return placeResult;
  }

  Future<PlaceDetail> getPlaceDetailsFromPlaceId(String placeId) async {
    var url =
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$apiKey";
    final response = await _dio.get<Object>(url);

    final placeDetails =
        PlaceDetails.fromJson(response.data as Map<String, dynamic>);

    return PlaceDetail.fromAddressComponent(placeDetails.result!);
  }
}
