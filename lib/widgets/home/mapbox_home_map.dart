import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/widget/home/mapbox_home_map_sizes.dart';

import 'package:travel_planner/providers/mapbox_provider.dart';

class MapboxHomeMap extends StatefulWidget {
  const MapboxHomeMap({super.key});

  @override
  State<MapboxHomeMap> createState() => _MapboxHomeMapState();
}

class _MapboxHomeMapState extends State<MapboxHomeMap> {
  Future<Position?>? futureCurrentPosition;

  @override
  void initState() {
    super.initState();
    futureCurrentPosition = Provider.of<MapboxProvider>(context, listen: false)
        .getCurrentLocation();
  }

  _onMapCreated(MapboxMapController controller) async {
    final mapboxProvider = context.read<MapboxProvider>();
    final marker = await mapboxProvider.loadMarkerImage();

    mapboxProvider.mapController = controller;
    await mapboxProvider.mapController!.addImage("marker", marker);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCurrentPosition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MapboxMap(
            onMapCreated: _onMapCreated,
            accessToken: const String.fromEnvironment("PUBLIC_ACCESS_TOKEN"),
            initialCameraPosition: CameraPosition(
              target: LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
              zoom: MapboxHomeMapSizes.initCameraZoomSizes,
            ),
            onMapClick: (_, latlng) async {
              await context
                  .watch<MapboxProvider>()
                  .mapController!
                  .animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(latlng.latitude, latlng.longitude),
                        zoom: MapboxHomeMapSizes.initCameraZoomSizes,
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
