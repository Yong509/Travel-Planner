import 'package:flutter/material.dart';
import 'package:travel_planner/widgets/mapbox_home_map.dart';
import 'package:travel_planner/widgets/search_text_filed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          MapboxHomeMap(),
          Positioned(
            top: 55,
            left: 20,
            right: 20,
            child: SearchTextField(),
          )
        ],
      ),
    );
  }
}
