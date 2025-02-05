import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.vehicles,
  });

  final List<Category> categories;
  final List<Vehicle> vehicles;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 300));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var gridView = GridView(
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

    return AnimatedBuilder(
      animation: _animationController,
      child: gridView,
      builder: (context, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut)),
        child: child,
      ),
    );
  }
}
