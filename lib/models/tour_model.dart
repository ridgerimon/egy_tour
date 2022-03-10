import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TourPlaces
{
  late var placeLatLng;
  late String placeName;
  late String distance;

  TourPlaces({
    required this.placeLatLng,
    required this.placeName,
    required this.distance,
  });

  TourPlaces.formJson(Map <String, dynamic>? json) {
    if (json == null) {
      return;
    }
    placeLatLng = json['placeLatLng'];
    placeName = json['placeName'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    return {
      'placeLatLng': placeLatLng,
      'placeName': placeName,
      'distance': distance,
    };
  }
}