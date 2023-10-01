import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:travel_planner/constants/mapbox_constants.dart';
import 'package:travel_planner/constants/widget/home/mapbox_home_map_sizes.dart';
import 'package:travel_planner/models/mapbox/category/category_enum.dart';
import 'package:travel_planner/models/mapbox/direction/direction.dart';
import 'package:travel_planner/models/mapbox/direction/routing_profile_enum.dart';
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

  Direction? _directions;
  Direction? get direction => _directions;

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
    await mapController!.clearSymbols();
    await mapController!.clearLines();
    final lat = selected.center![1];
    final lng = selected.center![0];
    // await drawLine(destinations: [LatLng(lat, lng)]);
    await mapController!.addSymbol(
      SymbolOptions(
        iconSize: MapboxHomeMapSizes.iconSize,
        iconImage: MapboxConstants.mapboxMarkerID,
        geometry: LatLng(lat, lng),
      ),
    );
    await mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: MapboxConstants.mapboxCameraZoomSelectedPlace,
        ),
      ),
    );

    notifyListeners();
  }

  Future<Uint8List> loadMarkerImage() async {
    final byteData =
        await rootBundle.load(MapboxConstants.mapboxMarkerAssetPath);
    return byteData.buffer.asUint8List();
  }

  Future<void> searchCategory({required CategoryEnum category}) async {
    final result = await services.searchCategory(
        category: category.name,
        proximity:
            "${_currentPosition!.longitude},${_currentPosition!.latitude}");
    mapController!.clearSymbols();
    if (result != null) {
      await mapController!.addSymbols(result.features!
          .map(
            (poi) => SymbolOptions(
              iconSize: MapboxHomeMapSizes.iconSize,
              iconImage: MapboxConstants.mapboxMarkerID,
              geometry: LatLng(poi.center![1], poi.center![0]),
              zIndex: 2,
            ),
          )
          .toList());
    }
  }

  Future<void> getDirections({
    required List<LatLng> destinations,
    RoutingProfile routingProfile = RoutingProfile.driving,
  }) async {
    final result = await services.directionRoute(
      destinations: destinations,
      routingProfile: routingProfile,
    );
    _directions = result;
    notifyListeners();
  }

  Future<void> drawLine(
      {required List<LatLng> destinations,
      RoutingProfile? routingProfile}) async {
    mapController!.clearLines();
    final destinationsParams = <LatLng>[
      LatLng(currentPosition!.latitude, currentPosition!.longitude),
      ...destinations
    ];
    await getDirections(
      destinations: destinationsParams,
      routingProfile: routingProfile ?? RoutingProfile.drivingTraffic,
    );

    if (direction != null) {
      for (var route in direction!.routes!.reversed) {
        List<LatLng> polyLine = [];
        PolylinePoints polylinePoints = PolylinePoints();
        List<PointLatLng> result =
            polylinePoints.decodePolyline(route.geometry!);
        for (var e in result) {
          polyLine.add(LatLng(e.latitude, e.longitude));
        }
        await mapController!.addLine(
          LineOptions(
            geometry: polyLine,
            lineColor: direction!.routes!.indexOf(route) == 0
                ? MapboxHomeMapSizes.selectedRoute
                : MapboxHomeMapSizes.unSelectedRoute,
            lineJoin: "round",
            lineWidth: 4,
          ),
        );
      }
      await mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(
          top: 300,
          bottom: 300,
          LatLngBounds(
            northeast:
                currentPosition!.latitude <= destinationsParams.last.latitude
                    ? LatLng(
                        destinationsParams.last.latitude,
                        destinationsParams.last.longitude,
                      )
                    : LatLng(
                        currentPosition!.latitude,
                        currentPosition!.longitude,
                      ),
            southwest: currentPosition!.latitude <=
                    destinationsParams.last.latitude
                ? LatLng(currentPosition!.latitude, currentPosition!.longitude)
                : LatLng(
                    destinationsParams.last.latitude,
                    destinationsParams.last.longitude,
                  ),
          ),
        ),
      );
    }
  }

  Future<void> fencingPlace({String? category, required double radius}) async {
    await services.fencingPlaceFromCurrentLocation(
      currentPosition:
          LatLng(currentPosition!.latitude, currentPosition!.longitude),
      radius: radius,
    );
  }
}
