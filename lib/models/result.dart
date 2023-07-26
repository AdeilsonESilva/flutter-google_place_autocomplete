import 'package:google_place_autocomplete/models/models.dart';

class Result {
  List<AddressComponents>? addressComponents;
  String? adrAddress;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? name;
  List<Photos>? photos;
  String? placeId;
  String? reference;
  String? scope;
  List<String>? types;
  String? url;
  int? utcOffset;
  String? vicinity;
  String? website;

  Result(
      {this.addressComponents,
      this.adrAddress,
      this.formattedAddress,
      this.geometry,
      this.icon,
      this.name,
      this.photos,
      this.placeId,
      this.reference,
      this.scope,
      this.types,
      this.url,
      this.utcOffset,
      this.vicinity,
      this.website});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents!.add(AddressComponents.fromJson(v));
      });
    }
    adrAddress = json['adr_address'];
    formattedAddress = json['formatted_address'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    name = json['name'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'].cast<String>();
    url = json['url'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addressComponents != null) {
      data['address_components'] =
          addressComponents!.map((v) => v.toJson()).toList();
    }
    data['adr_address'] = adrAddress;
    data['formatted_address'] = formattedAddress;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['icon'] = icon;
    data['name'] = name;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['place_id'] = placeId;
    data['reference'] = reference;
    data['scope'] = scope;
    data['types'] = types;
    data['url'] = url;
    data['utc_offset'] = utcOffset;
    data['vicinity'] = vicinity;
    data['website'] = website;
    return data;
  }
}
