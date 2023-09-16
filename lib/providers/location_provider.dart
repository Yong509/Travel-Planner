import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  LocationProvider() {
    getCurrentLocation();
  }

  Future<Position?> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentPosition = position;
      print("current position ${_currentPosition!.latitude}");
      notifyListeners();
      return position;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
