import 'dart:convert';

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
}
