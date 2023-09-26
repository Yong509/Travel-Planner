import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';

class DetailView extends StatefulWidget {
  final TabController tabbarController;
  const DetailView({super.key, required this.tabbarController});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
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
        Consumer<MapboxProvider>(
          builder: (context, mapboxProvider, child) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                        child: const Icon(
                          PhosphorIcons.navigation_arrow_fill,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Expanded(
                        child: Text("ตำแหน่งปัจจุบันของฉัน"),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    indent: 30,
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
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Color(0XFF007AFF),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            PhosphorIcons.airplane_fill,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
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
        )
      ],
    );
  }
}
