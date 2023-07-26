import 'package:google_place_autocomplete/models/models.dart';

class PlaceDetail {
  final String fullAddress;

  final String? neighborhood;
  final String? street;
  final String? city;
  final String? state;
  final String? stateUf;
  final String country;
  final String? postalCode;
  final String? number;
  final LatLng coordinates;
  final bool isFullAddress;

  PlaceDetail({
    required this.fullAddress,
    required this.neighborhood,
    required this.street,
    required this.city,
    required this.state,
    required this.stateUf,
    required this.country,
    required this.coordinates,
    this.number,
    this.postalCode,
    this.isFullAddress = false,
  });

  factory PlaceDetail.fromAddressComponent(Result? result) {
    String? number;
    String street = '';
    String? neighborhood;
    String? state;
    String? stateUf;
    String? city;
    String? country;
    String? postalCode;

    final location = result!.geometry!.location;
    final components = result.addressComponents ?? [];

    for (var component in components) {
      final types = component.types ?? [];

      if (types.contains('street_number')) {
        number = component.longName ?? '';
      } else if (types.contains('route') ||
          types.contains('sublocality_level_3') ||
          types.contains('premise') ||
          types.contains('street_address')) {
        street = '$street ${component.longName ?? ''}';
      } else if (types.contains('sublocality_level_2') ||
          types.contains('sublocality_level_1')) {
        neighborhood = component.longName;
      } else if (types.contains('administrative_area_level_1')) {
        state = component.longName ?? '';
        stateUf = component.shortName ?? '';
      } else if (types.contains('administrative_area_level_4') ||
          types.contains('administrative_area_level_2')) {
        city = component.longName ?? '';
      } else if (types.contains('country')) {
        country = component.longName ?? '';
      } else if (types.contains('postal_code') &&
          !types.contains('postal_code_prefix')) {
        postalCode = component.longName ?? '';
      }
    }

    if (street.isEmpty && result.name != null) {
      street = result.name!;
    }

    final isBrasilia = city?.contains('Brasília') ?? false;

    return PlaceDetail(
      street: street.trim(),
      number: number,
      city: city,
      neighborhood: neighborhood,
      state: state,
      stateUf: stateUf,
      country: country ?? '',
      postalCode: postalCode,
      fullAddress: result.formattedAddress ?? '',
      coordinates: LatLng(location!.lat!, location.lng!),
      isFullAddress: {
        if (!isBrasilia) ...[street],
        city,
        state,
      }.every((element) => element != null),
    );
  }
}
