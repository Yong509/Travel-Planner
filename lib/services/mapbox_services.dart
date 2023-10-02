import 'dart:convert';

import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:travel_planner/constants/mapbox_constants.dart';
import 'package:travel_planner/models/mapbox/direction/direction.dart';
import 'package:travel_planner/models/mapbox/direction/routing_profile_enum.dart';
import 'package:travel_planner/models/mapbox/geocoding/geocoding_places.dart';
import 'package:travel_planner/models/mapbox/tilequery/tilequery.dart';
import '../constants/http_constant.dart';
import 'http_clinent_service.dart';
import 'dart:math';

class MapboxServices {
  MapboxServices(this.httpClientService);
  final HttpClientService httpClientService;
  final accessKey = const String.fromEnvironment("PUBLIC_ACCESS_TOKEN");

  Future<GeocodingPlaces?> searchPlace({required String place}) async {
    final url = Uri.parse(
        '${HttpConstants.api_base_url}geocoding/v5/mapbox.places/$place.json?access_token=$accessKey&limit=6');
    final response = await httpClientService.get(url);

    return response.statusCode == HttpConstants.statusOk
        ? GeocodingPlaces.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<GeocodingPlaces?> searchCategory(
      {required String category, required String proximity}) async {
    final url = Uri.parse(
      '${HttpConstants.api_base_url}geocoding/v5/mapbox.places/$category.json?type=poi&proximity=$proximity&access_token=$accessKey&limit=25',
    );
    final response = await httpClientService.get(url);
    return response.statusCode == HttpConstants.statusOk
        ? GeocodingPlaces.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<Direction?> directionRoute({
    required List<LatLng> destinations,
    RoutingProfile routingProfile = RoutingProfile.driving,
  }) async {
    final destinationParams = destinations
        .map((latLng) => '${latLng.longitude}%2C${latLng.latitude}')
        .join('%3B');
    final profile = getRoutingProfileValue(routingProfile);
    final url = Uri.parse(
        "${HttpConstants.api_base_url}directions/v5/mapbox/$profile/$destinationParams?alternatives=true&geometries=polyline&language=en&overview=full&steps=true&access_token=$accessKey");
    final response = await httpClientService.get(url);
    return response.statusCode == HttpConstants.statusOk
        ? Direction.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<Tilequery?> fencingPlaceFromCurrentLocation(
      {List<String>? categories,
      required LatLng currentPosition,
      required double radius}) async {
    String? formatCategories;
    if (categories != null && categories.isNotEmpty) {
      formatCategories = categories.join("%2C");
    }

    final url = Uri.parse(
      "${HttpConstants.api_base_url}v4/mapbox.mapbox-streets-v8/tilequery/"
      "${currentPosition.longitude},${currentPosition.latitude}.json?"
      "${categories != null && categories.isNotEmpty ? "layers=$formatCategories&" : ""}"
      "radius=$radius&limit=50&access_token=$accessKey",
    );
    final response = await httpClientService.get(url);
    final queryResponse = Tilequery.fromJson(jsonDecode(response.body));
    print(
        "tile query ${queryResponse.features![0].geometry!.coordinates![0]} ${queryResponse.features![0].geometry!.coordinates![1]}");
    return response.statusCode == HttpConstants.statusOk
        ? Tilequery.fromJson(jsonDecode(response.body))
        : null;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }

  double degrees(double radians) {
    return radians * (180 / pi);
  }

  Future<LatLng> calculateNextCoordinates(double startLat, double startLng,
      double distanceKm, double bearingDegrees) async {
    double bearingRadians = radians(bearingDegrees);

    double startLatRadians = radians(startLat);
    double startLngRadians = radians(startLng);

    double newLatRadians = asin(
        sin(startLatRadians) * cos(distanceKm / MapboxConstants.earthRadiusKm) +
            cos(startLatRadians) *
                sin(distanceKm / MapboxConstants.earthRadiusKm) *
                cos(bearingRadians));

    double newLngRadians = startLngRadians +
        atan2(
            sin(bearingRadians) *
                sin(distanceKm / MapboxConstants.earthRadiusKm) *
                cos(startLatRadians),
            cos(distanceKm / MapboxConstants.earthRadiusKm) -
                sin(startLatRadians) * sin(newLatRadians));

    double newLat = degrees(newLatRadians);
    double newLng = degrees(newLngRadians);

    return LatLng(newLat, newLng);
  }

  double calculateHaversineDistance(LatLng point1, LatLng point2) {
    double lat1 = radians(point1.latitude);
    double lon1 = radians(point1.longitude);
    double lat2 = radians(point2.latitude);
    double lon2 = radians(point2.longitude);

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a =
        pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return MapboxConstants.earthRadiusKm * c;
  }

  List<LatLng> findNearMatches(
      LatLng target, List<LatLng> coordinates, double maxDistance) {
    List<LatLng> nearMatches = [];
    for (LatLng coordinate in coordinates) {
      double distance = calculateHaversineDistance(target, coordinate);

      if (distance <= maxDistance) {
        nearMatches.add(coordinate);
      }
    }
    return nearMatches;
  }
}
