import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_ui_strings.dart';

import '../../providers/location_provider.dart';

class SlideBottomSheet extends StatefulWidget {
  const SlideBottomSheet({super.key});

  @override
  State<SlideBottomSheet> createState() => _SlideBottomSheetState();
}

class _SlideBottomSheetState extends State<SlideBottomSheet> {
  final BoxController boxController = BoxController();
  final TextEditingController searchController = TextEditingController();
  Timer? isStopTyping;
  bool? isLoading;

  _onChange(String value) {
    if (isStopTyping != null) {
      setState(() => isStopTyping?.cancel());
    }

    setState(() {
      isStopTyping = Timer(const Duration(seconds: 2), () async {
        await _onSearchPlace(searched: value);
      });
    });
  }

  _onSearchPlace({required String searched}) async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    await locationProvider.searchPlace(searchedPlace: searched);
  }

  @override
  Widget build(BuildContext context) {
    return SlidingBox(
      controller: boxController,
      minHeight: SlideBottomSheetSlideSizes().bottomSheetMinHeight(context),
      maxHeight: SlideBottomSheetSlideSizes().bottomSheetMaxHeight(context),
      color: Colors.white,
      collapsed: true,
      draggableIconBackColor: Colors.white,
      body: Padding(
        padding: SlideBottomSheetSlideSizes.bottomSheetBodyPadding,
        child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: TextField(
                    controller: searchController,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) => _onChange(value),
                    decoration: InputDecoration(
                      contentPadding: SlideBottomSheetSlideSizes
                          .bottomSheetSearchDestContentPadding,
                      hintText:
                          SlideBottomSheetUiStrings.bottomSheetSearchPlaceHint,
                      fillColor: Colors.grey[100],
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          SlideBottomSheetSlideSizes
                              .bottomSheetSearchDestPlaceBorderRadius,
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                if (locationProvider.searchPlaceResults != null) ...[
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount:
                        locationProvider.searchPlaceResults!.features!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          locationProvider
                              .searchPlaceResults!.features![index].text!,
                        ),
                        subtitle: Text(locationProvider
                            .searchPlaceResults!.features![index].placeName!
                            .substring(locationProvider.searchPlaceResults!
                                    .features![index].placeName!
                                    .indexOf(",") +
                                2)),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: SlideBottomSheetSlideSizes
                            .resultSearchPlacePaddingDivider,
                        child: Divider(
                          color: Colors.black.withAlpha(20),
                          thickness: SlideBottomSheetSlideSizes
                              .resultSearchPlacePaddingDividerThickness,
                          height: SlideBottomSheetSlideSizes
                              .resultSearchPlacePaddingDividerHigh,
                        ),
                      );
                    },
                  ),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
