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
    print(
        "${HttpConstants.api_base_url}directions/v5/mapbox/$profile/$destinationParams?alternatives=true&geometries=polyline&language=en&overview=full&steps=true&access_token=$accessKey");
    final response = await httpClientService.get(url);
    return response.statusCode == HttpConstants.statusOk
        ? Direction.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<Tilequery?> fencingPlaceFromCurrentLocation(
      {List<String>? categories,
      required LatLng poi,
      required double radius}) async {
    String? formatCategories;
    if (categories != null && categories.isNotEmpty) {
      formatCategories = categories.join("%2C");
    }

    final url = Uri.parse(
      "${HttpConstants.api_base_url}v4/mapbox.mapbox-streets-v8/tilequery/"
      "${poi.longitude},${poi.latitude}.json?"
      "${categories != null && categories.isNotEmpty ? "layers=$formatCategories&" : ""}"
      "radius=$radius&limit=50&access_token=$accessKey",
    );
    final response = await httpClientService.get(url);
    final queryResponse = Tilequery.fromJson(jsonDecode(response.body));
    print(
        "tile query ${queryResponse.type} ${queryResponse.features![0].geometry!.type}");
    return response.statusCode == HttpConstants.statusOk
        ? Tilequery.fromJson(jsonDecode(response.body))
        : null;
  }

  double calculateDistance(LatLng point1, LatLng point2) {
    double radiusOfEarth = MapboxConstants.earthRadiusKm;

    double lat1 = point1.latitude * pi / 180;
    double lon1 = point1.longitude * pi / 180;
    double lat2 = point2.latitude * pi / 180;
    double lon2 = point2.longitude * pi / 180;

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = radiusOfEarth * c;
    return distance;
  }

  List<LatLng> filterLatLngList(
      List<LatLng> latLngList, double distanceThreshold) {
    List<LatLng> filteredList = [];
    if (latLngList.isEmpty) {
      return filteredList;
    }

    filteredList.add(latLngList[0]);

    for (int i = 1; i < latLngList.length; i++) {
      double distance = calculateDistance(filteredList.last, latLngList[i]);
      if (distance >= distanceThreshold) {
        filteredList.add(latLngList[i]);
      }
    }

    return filteredList;
  }
}
