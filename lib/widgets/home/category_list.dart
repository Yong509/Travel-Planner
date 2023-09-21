import 'package:flutter/material.dart';
import 'package:travel_planner/models/mapbox/category/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return Container(
            key: Key(listCategory[index].category.name),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: Image.asset(
              "assets/icons/restaurant_icon.png",
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
