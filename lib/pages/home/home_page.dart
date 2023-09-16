import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MapboxMapController? mapController;

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        onMapCreated: _onMapCreated,
        accessToken:
            "pk.eyJ1Ijoia2Vya3dpdCIsImEiOiJjbG1sbDE0bjEwYjd4MnN0bnkzeWJuY2hyIn0.OEg3-6uzcjfF8r1MhKWIEw",
        initialCameraPosition: const CameraPosition(
          target: LatLng(14.057977, 100.614802),
          zoom: 9.0,
        ),
        myLocationEnabled: true,
        trackCameraPosition: true,
      ),
    );
  }
}
