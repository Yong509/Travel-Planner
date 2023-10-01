import 'package:flutter/material.dart';
import 'package:travel_planner/widgets/home/route_tab/route_path.dart';

class RouteTab extends StatefulWidget {
  final TabController tabbarController;
  const RouteTab({super.key, required this.tabbarController});

  @override
  State<RouteTab> createState() => _RouteTabState();
}

class _RouteTabState extends State<RouteTab> {
  final searchController = TextEditingController();

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoutePath(tabbarController: widget.tabbarController),
      ],
    );
  }
}
