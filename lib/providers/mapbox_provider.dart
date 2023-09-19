import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_planner/models/mapbox/geocoding/geocoding_places.dart';
import 'package:travel_planner/services/mapbox_services.dart';

class MapboxProvider extends ChangeNotifier {
  final MapboxServices services;
  MapboxProvider(this.services) {
    getCurrentLocation();
  }

  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;
  GeocodingPlaces? _searchPlaceResults;
  GeocodingPlaces? get searchPlaceResults => _searchPlaceResults;

  Future<Position?> getCurrentLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentPosition = position;

      notifyListeners();
      return position;
    } else {
      return null;
    }
  }

  Future<void> searchPlace({required String searchedPlace}) async {
    _searchPlaceResults = await services.searchPlace(place: searchedPlace);
    print("search ${_searchPlaceResults}");
    notifyListeners();
  }
}
