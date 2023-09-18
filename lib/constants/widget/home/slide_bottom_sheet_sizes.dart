import 'package:flutter/material.dart';

class SlideBottomSheetSlideSizes {
  double bottomSheetMinHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.15;
  }

  double bottomSheetMaxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.5;
  }

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
