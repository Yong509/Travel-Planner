import 'package:flutter/material.dart';
import 'package:travel_planner/widgets/home/slide_bottom_sheet.dart';

import '../../widgets/home/mapbox_home_map.dart';

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
        alignment: Alignment.center,
        children: [MapboxHomeMap(), SlideBottomSheet()],
      ),
    );
  }
}
