import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/common_ui_strings.dart';
import 'package:travel_planner/constants/widget/home/route_tab/route_tab_sizes.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';
import 'package:travel_planner/utils/build_context_extension.dart';

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
                    padding: RouteTabSizes.routePathPadding,
                    decoration: const BoxDecoration(
                      color: Color(0XFF007AFF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      PhosphorIcons.navigation_arrow_fill,
                      size: RouteTabSizes.iconSizes,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: RouteTabSizes.iconTextSpace),
                  Expanded(
                    child: Text(
                      CommonUIStrings.myCurrentLocation,
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: RouteTabSizes.verticalDividerPadding,
                    height: RouteTabSizes.verticalDividerHeight,
                    child: DottedLine(
                      lineThickness: RouteTabSizes.verticalDividerThickness,
                      dashGapLength: RouteTabSizes.verticalDividerDashGapLength,
                      dashRadius: RouteTabSizes.verticalDividerRadius,
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      dashColor: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.1),
                      indent: RouteTabSizes.dividerIndent,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                          decoration: const BoxDecoration(
                            color: Color(0XFF007AFF),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            PhosphorIcons.map_pin_fill,
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
                            style: context.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
