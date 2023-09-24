import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/constants/widget/home/category_list_sizes.dart';
import 'package:travel_planner/models/mapbox/category/category.dart';
import 'package:travel_planner/providers/mapbox_provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: CategoryListSizes.categoryHeight,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: CategoryListSizes.categoryBorderRadius,
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: CategoryListSizes.gridViewPadding,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: CategoryListSizes.gridViewMaxCrossExistExtent,
          crossAxisSpacing: CategoryListSizes.gridViewCrossAxisSpacing,
          mainAxisSpacing: CategoryListSizes.gridViewMainAxisSpacing,
          mainAxisExtent: CategoryListSizes.gridViewMainAxisExtent,
        ),
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              final mapController = context.read<MapboxProvider>();
              await mapController.searchCategory(
                  category: listCategory[index].category);
            },
            child: Container(
              key: Key(listCategory[index].category.name),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: Image.asset(
                listCategory[index].iconPath,
                color: Colors.white,
                scale: 8,
              ),
            ),
          );
        },
      ),
    );
  }
}
