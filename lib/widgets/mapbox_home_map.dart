import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import '../providers/location_provider.dart';

class MapboxHomeMap extends StatefulWidget {
  const MapboxHomeMap({super.key});

  @override
  State<MapboxHomeMap> createState() => _MapboxHomeMapState();
}

class _MapboxHomeMapState extends State<MapboxHomeMap> {
  MapboxMapController? mapController;
  Future<Position?>? futureCurrentPosition;

  @override
  void initState() {
    super.initState();
    futureCurrentPosition =
        Provider.of<LocationProvider>(context, listen: false)
            .getCurrentLocation();
  }

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCurrentPosition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MapboxMap(
            onMapCreated: _onMapCreated,
            accessToken:
                "pk.eyJ1Ijoia2Vya3dpdCIsImEiOiJjbG1sbDE0bjEwYjd4MnN0bnkzeWJuY2hyIn0.OEg3-6uzcjfF8r1MhKWIEw",
            initialCameraPosition: CameraPosition(
              target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
              zoom: 9.0,
            ),
            onMapClick: (_, latlng) async {
              await mapController?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(latlng.latitude, latlng.longitude),
                    zoom: 9.0,
                  ),
                ),
              );
            },
            myLocationEnabled: true,
            trackCameraPosition: true,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
