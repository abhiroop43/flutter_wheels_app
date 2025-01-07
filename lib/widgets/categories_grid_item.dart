import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/screens/vehicles_screen.dart';

class CategoriesGridItem extends StatelessWidget {
  final Category category;
  final List<Vehicle> vehicles;
  const CategoriesGridItem({super.key, required this.category, required this.vehicles});

  List<Vehicle> _selectCategory(String categoryId) {
    return vehicles
        .where((vehicle) => vehicle.categoryIds.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return VehiclesScreen(
            title: category.name,
            vehicles: _selectCategory(category.id),
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.9),
              category.color.withValues(alpha: 0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.name,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
