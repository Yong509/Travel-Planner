import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/models/mapbox/direction/routing_profile_enum.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';
import 'package:travel_planner/utils/build_context_extension.dart';
import 'package:travel_planner/widgets/home/detail_tab/travel_method_button.dart';

class DetailTab extends StatefulWidget {
  final TabController tabbarController;
  const DetailTab({super.key, required this.tabbarController});

  @override
  State<DetailTab> createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  _onSelectRoutingProfile(
      MapboxProvider mapboxProvider, RoutingProfile routingProfile) async {
    final geo = mapboxProvider.selectedPlace!.geometry!;
    if (geo.coordinates != null) {
      await mapboxProvider.drawLine(destinations: [
        LatLng(geo.coordinates![1], geo.coordinates![0]),
      ], routingProfile: routingProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapboxProvider>(
      builder: (context, mapboxProvider, child) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                widget.tabbarController.animateTo(0);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  mapboxProvider.selectedPlace!.text!,
                  style: context.textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: RoutingProfile.values.map((method) {
                switch (method) {
                  case RoutingProfile.driving:
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TravelMethodButton(
                            onPressed: () async {
                              await _onSelectRoutingProfile(
                                  mapboxProvider, RoutingProfile.driving);
                            },
                            icon: PhosphorIcons.car_fill),
                      ),
                    );
                  case RoutingProfile.cycling:
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TravelMethodButton(
                            onPressed: () async {
                              await _onSelectRoutingProfile(
                                  mapboxProvider, RoutingProfile.cycling);
                            },
                            icon: PhosphorIcons.bicycle_fill),
                      ),
                    );
                  case RoutingProfile.walking:
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: TravelMethodButton(
                            onPressed: () async {
                              await _onSelectRoutingProfile(
                                  mapboxProvider, RoutingProfile.walking);
                            },
                            icon: PhosphorIcons.person_simple_walk_fill),
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
