import 'dart:convert';

import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:travel_planner/models/mapbox/direction/direction.dart';
import 'package:travel_planner/models/mapbox/direction/routing_profile_enum.dart';
import 'package:travel_planner/models/mapbox/geocoding/geocoding_places.dart';
import '../constants/http_constant.dart';
import 'http_clinent_service.dart';

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
}
