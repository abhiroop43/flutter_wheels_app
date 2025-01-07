import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.categories, required this.vehicles,
  });

  final List<Category> categories;
  final List<Vehicle> vehicles;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: widget.categories.map((category) {
        return CategoriesGridItem(
          category: category,
          vehicles: widget.vehicles,
        );
      }).toList(),
    );
  }
}
