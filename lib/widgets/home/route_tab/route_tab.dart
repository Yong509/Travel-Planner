import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/widget/home/route_tab/route_tab_sizes.dart';
import 'package:travel_planner/constants/widget/home/route_tab/route_tab_ui_strings.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';
import 'package:travel_planner/utils/build_context_extension.dart';
import 'package:travel_planner/widgets/home/route_tab/route_path.dart';

class RouteTab extends StatefulWidget {
  final TabController tabbarController;
  const RouteTab({super.key, required this.tabbarController});

  @override
  State<RouteTab> createState() => _RouteTabState();
}

class _RouteTabState extends State<RouteTab> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        SizedBox(
          height: RouteTabSizes.routePathRadiusSpacing,
        ),
        Text(RouteTabUIStrings.hintTextRadius),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return RouteTabUIStrings.errorTextRadius;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: RouteTabSizes.routePathRadiusSpacing,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(RouteTabUIStrings.searching),
                        ),
                      );
                      final mapboxProvider = context.read<MapboxProvider>();
                      await mapboxProvider.fencingPlace(
                          radius: double.parse(searchController.text) * 1000);
                    }
                  },
                  child: Text(
                    RouteTabUIStrings.search,
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
