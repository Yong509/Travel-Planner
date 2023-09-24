import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:travel_planner/constants/widget/home/slide_bottom_sheet_sizes.dart';
import 'package:travel_planner/widgets/home/detail_view.dart';
import 'package:travel_planner/widgets/home/suggestion_view.dart';

class SlideBottomSheet extends StatefulWidget {
  const SlideBottomSheet({super.key});

  @override
  State<SlideBottomSheet> createState() => _SlideBottomSheetState();
}

class _SlideBottomSheetState extends State<SlideBottomSheet>
    with TickerProviderStateMixin {
  final panelController = PanelController();
  late final TabController tabbarController;

  @override
  void initState() {
    super.initState();
    tabbarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabbarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      minHeight: SlideBottomSheetSlideSizes.bottomSheetMinHeight(context),
      maxHeight: SlideBottomSheetSlideSizes.bottomSheetMaxHeight(context),
      color: Colors.white,
      borderRadius: SlideBottomSheetSlideSizes.radius,
      defaultPanelState: PanelState.CLOSED,
      panel: Padding(
        padding: SlideBottomSheetSlideSizes.panelBodyPadding,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: SlideBottomSheetSlideSizes.panelPullUpButtonWidth,
              height: SlideBottomSheetSlideSizes.panelPullUpButtonHeight,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 200, 192, 192),
                borderRadius: SlideBottomSheetSlideSizes.pullUpButtonRadius,
              ),
            ),
            SizedBox(
              height:
                  SlideBottomSheetSlideSizes.panelPullUpButtonListResultDivider,
            ),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabbarController,
                children: [
                  SuggestionView(
                    panelController: panelController,
                    tabbarController: tabbarController,
                  ),
                  DetailView(
                    tabbarController: tabbarController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
