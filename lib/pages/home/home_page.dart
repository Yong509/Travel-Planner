import 'package:flutter/material.dart';

import '../../widgets/home/mapbox_home_map.dart';
import '../../widgets/home/search_places.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          MapboxHomeMap(),
          Positioned(
            top: 55,
            left: 20,
            right: 20,
            child: SearchTextField(),
          ),
        ],
      ),
    );
  }
}
