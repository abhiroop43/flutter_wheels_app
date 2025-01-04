import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/screens/favorites_screen.dart';
import 'package:flutter_wheels_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.getCategories();
    int currentPageIndex = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('Categories',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer)),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        bottomNavigationBar: NavigationBar(
          height: 64,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
              selectedIcon: Icon(Icons.category),
            ),
            NavigationDestination(
              icon: Icon(Icons.star_outline),
              label: 'Favorites',
              selectedIcon: Icon(Icons.star),
            )
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return FavoritesScreen();
            }));
          },
        ),
        body: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: categories.map((category) {
            return CategoriesGridItem(category: category);
          }).toList(),
        ));
  }
}
