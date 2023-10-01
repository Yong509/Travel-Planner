import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/widget/home/route_tab/route_tab_sizes.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';

class RoutePath extends StatefulWidget {
  final TabController tabbarController;
  const RoutePath({super.key, required this.tabbarController});

  @override
  State<RoutePath> createState() => _RoutePathState();
}

class _RoutePathState extends State<RoutePath> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<MapboxProvider>(
      builder: (context, mapboxProvider, child) {
        return Container(
          padding: RouteTabSizes.tabPadding,
          decoration: BoxDecoration(
            color: const Color(0XFFd2d4d6).withOpacity(0.4),
            borderRadius: SlideBottomSheetSlideSizes.pullUpButtonRadius,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: const Color(0XFF007AFF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      PhosphorIcons.navigation_arrow_fill,
                      size: RouteTabSizes.iconSizes,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: RouteTabSizes.iconTextSpace),
                  const Expanded(
                    child: Text("ตำแหน่งปัจจุบันของฉัน"),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
                indent: RouteTabSizes.iconTextSpace,
              ),
              GestureDetector(
                onTap: () {
                  widget.tabbarController.animateTo(0);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: RouteTabSizes.routePathPadding,
                      decoration: BoxDecoration(
                        color: const Color(0XFF007AFF),
                        borderRadius: RouteTabSizes.routePathBorderRadius,
                      ),
                      child: Icon(
                        PhosphorIcons.airplane_fill,
                        size: RouteTabSizes.iconSizes,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: RouteTabSizes.iconTextSpace,
                    ),
                    Expanded(
                      child: Text(
                        mapboxProvider.selectedPlace!.text.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
