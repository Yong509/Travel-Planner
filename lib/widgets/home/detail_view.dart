import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final TabController tabbarController;
  const DetailView({super.key, required this.tabbarController});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            widget.tabbarController.animateTo(0);
          },
          child: Text("close")),
    );
  }
}
