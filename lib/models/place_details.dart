import 'package:google_place_autocomplete/models/models.dart';

class PlaceDetails {
  Result? result;
  String? status;

  PlaceDetails({this.result, this.status});

  PlaceDetails.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    return data;
  }
}
