import 'package:travel_planner/models/mapbox/category/category_enum.dart';

class Category {
  final CategoryEnum category;
  final String iconPath;

  Category({required this.category, required this.iconPath});
}

List<Category> listCategory = [
  Category(
      category: CategoryEnum.restaurant,
      iconPath: "assets/icons/restaurant_icon.png"),
  Category(
      category: CategoryEnum.restaurant,
      iconPath: "assets/icons/museum_icon.png"),
  Category(
      category: CategoryEnum.restaurant,
      iconPath: "assets/icons/restaurant_icon.png"),
  Category(
      category: CategoryEnum.restaurant,
      iconPath: "assets/icons/restaurant_icon.png"),
  Category(
      category: CategoryEnum.restaurant,
      iconPath: "assets/icons/restaurant_icon.png"),
  Category(
      category: CategoryEnum.restaurant,
      iconPath: "assets/icons/restaurant_icon.png"),
];
