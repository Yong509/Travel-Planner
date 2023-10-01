import 'package:flutter/material.dart';
import 'package:travel_planner/constants/widget/home/route_tab/route_tab_sizes.dart';

class TravelMethodButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const TravelMethodButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 13),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: RouteTabSizes.travelMethodButtonBorderRaidus,
        ),
      ),
      child: Icon(
        icon,
        color: const Color(0XFF007AFF),
      ),
    );
  }
}
