import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_ui_strings.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';
import 'package:travel_planner/widgets/home/search_result_list.dart';

class SlideBottomSheet extends StatefulWidget {
  const SlideBottomSheet({super.key});

  @override
  State<SlideBottomSheet> createState() => _SlideBottomSheetState();
}

class _SlideBottomSheetState extends State<SlideBottomSheet> {
  final panelController = PanelController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool onFocus = false;
  Timer? isStopTyping;
  bool? isLoading;

  @override
  void initState() {
    super.initState();

    searchFocusNode.addListener(() {
      if (searchFocusNode.hasFocus) {
        panelController.open();
      }
    });
  }

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
    final mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    await mapboxProvider.searchPlace(searchedPlace: searched);
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      minHeight: SlideBottomSheetSlideSizes.bottomSheetMinHeight(context),
      maxHeight: SlideBottomSheetSlideSizes.bottomSheetMaxHeight(context),
      color: Colors.white,
      borderRadius: SlideBottomSheetSlideSizes.radius,
      defaultPanelState: onFocus ? PanelState.OPEN : PanelState.CLOSED,
      panel: Padding(
        padding: SlideBottomSheetSlideSizes.panelBodyPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: SlideBottomSheetSlideSizes.panelPullUpButtonWidth,
              height: SlideBottomSheetSlideSizes.panelPullUpButtonHeight,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: SlideBottomSheetSlideSizes.pullUpButtonRadius,
              ),
            ),
            SizedBox(
              height:
                  SlideBottomSheetSlideSizes.panelPullUpButtonListResultDivider,
            ),
            TextField(
              focusNode: searchFocusNode,
              controller: searchController,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => _onChange(value),
              decoration: InputDecoration(
                contentPadding: SlideBottomSheetSlideSizes
                    .bottomSheetSearchDestContentPadding,
                hintText: SlideBottomSheetUiStrings.bottomSheetSearchPlaceHint,
                fillColor: Colors.grey[100],
                filled: true,
                suffixIcon: const Icon(
                  Icons.search,
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
            SearchResultList(
              onSelected: (place) {
                panelController.close();
              },
            ),
          ],
        ),
      ),
    );
  }
}
