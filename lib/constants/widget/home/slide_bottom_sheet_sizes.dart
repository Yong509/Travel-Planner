import 'package:flutter/material.dart';
import 'package:travel_planner/utils/build_context_extension.dart';

class SlideBottomSheetSlideSizes {
  static double bottomSheetMinHeight(BuildContext context) {
    return context.mediaQuery.size.height * 0.15;
  }

  static double bottomSheetMaxHeight(BuildContext context) {
    return context.mediaQuery.size.height * 0.65;
  }

  static BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  static BorderRadiusGeometry pullUpButtonRadius = BorderRadius.circular(20);
  static const EdgeInsets panelBodyPadding =
      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15);
  static double panelPullUpButtonHeight = 10.0;
  static double panelPullUpButtonWidth = 50.0;

  static double panelPullUpButtonListResultDivider = 20.0;

  static EdgeInsets bottomSheetBodyPadding =
      const EdgeInsets.symmetric(vertical: 20, horizontal: 15);
  static double bottomSheetSearchDestPlaceBorderRadius = 20.0;
  static EdgeInsets bottomSheetSearchDestContentPadding =
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets resultSearchPlacePaddingDivider =
      const EdgeInsets.symmetric(horizontal: 20);
  static double resultSearchPlacePaddingDividerThickness = 1;
  static double resultSearchPlacePaddingDividerHigh = 1;
}
