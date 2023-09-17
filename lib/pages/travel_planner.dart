import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:travel_planner/pages/home/home_page.dart';
import 'package:travel_planner/providers/location_provider.dart';
import 'package:travel_planner/services/mapbox_services.dart';

import '../services/http_clinent_service.dart';

class TravelPlanner extends StatefulWidget {
  const TravelPlanner({super.key});

  @override
  State<TravelPlanner> createState() => _TravelPlannerState();
}

class _TravelPlannerState extends State<TravelPlanner> {
  late HttpClientService httpClientService;
  List<SingleChildWidget> _initializeServices() {
    httpClientService = HttpClientService();
    return [
      Provider<HttpClientService>.value(value: httpClientService),
      Provider(create: (context) => MapboxServices(httpClientService)),
      ChangeNotifierProvider(
        create: (context) => LocationProvider(
          Provider.of<MapboxServices>(context, listen: false),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final providers = _initializeServices();
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
