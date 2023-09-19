import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:travel_planner/constants/widget/home/mapbox_home_map_sizes.dart';
import 'package:travel_planner/models/mapbox/geocoding/geocoding_places.dart';
import 'package:travel_planner/services/mapbox_services.dart';

class MapboxProvider extends ChangeNotifier {
  final MapboxServices services;
  MapboxProvider(this.services);

  MapboxMapController? _mapController;
  MapboxMapController? get mapController => _mapController;
  set mapController(MapboxMapController? controller) {
    _mapController = controller;
    notifyListeners();
  }

  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  GeocodingPlaces? _searchPlaceResults;
  GeocodingPlaces? get searchPlaceResults => _searchPlaceResults;

  Feature? _selectedPlace;
  Feature? get selectedPlace => _selectedPlace;

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
    notifyListeners();
  }

  Future<void> setSelectedPlace({required Feature selected}) async {
    _selectedPlace = selected;
    final lat = selected.center![1];
    final lng = selected.center![0];
    await mapController!.addSymbol(
      SymbolOptions(
        iconSize: MapboxHomeMapSizes.iconSize,
        iconImage: "marker",
        geometry: LatLng(lat, lng),
      ),
    );
    await mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: MapboxHomeMapSizes.searchedCameraZoomSizes,
        ),
      ),
    );

    notifyListeners();
  }

  Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load("assets/icons/marker.png");
    return byteData.buffer.asUint8List();
  }
}
