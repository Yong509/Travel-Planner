import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_ui_strings.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';
import 'package:travel_planner/widgets/home/search_result_list.dart';

class SuggestionView extends StatefulWidget {
  final PanelController panelController;
  final TabController tabbarController;

  const SuggestionView({
    super.key,
    required this.panelController,
    required this.tabbarController,
  });

  @override
  State<SuggestionView> createState() => _SuggestionViewState();
}

class _SuggestionViewState extends State<SuggestionView> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  Timer? isStopTyping;
  bool? isLoading;

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    searchFocusNode.addListener(() {
      if (searchFocusNode.hasFocus) {
        widget.panelController.open();
      }
    });
    super.initState();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          focusNode: searchFocusNode,
          controller: searchController,
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) => _onChange(value),
          decoration: InputDecoration(
            contentPadding:
                SlideBottomSheetSlideSizes.bottomSheetSearchDestContentPadding,
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
        // const Padding(
        //   padding: SlideBottomSheetSlideSizes.searchTextCateoriesDivider,
        //   child: CategoryList(),
        // ),
        Flexible(
          child: SearchResultList(
            onSelected: (place) {
              searchController.text = place.text ?? "";
              widget.panelController.animatePanelToPosition(
                  widget.panelController.panelPosition / 2,
                  duration: const Duration(milliseconds: 300));
              widget.tabbarController.animateTo(1);
            },
          ),
        ),
      ],
    );
  }
}
