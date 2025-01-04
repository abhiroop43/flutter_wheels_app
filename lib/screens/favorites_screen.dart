import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/screens/categories_screen.dart';


// FIXME: Favorites screen should not be separate, as it is causing issues with the bottomNavigationBar

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites',
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
            return CategoriesScreen();
          }));
        },
      ),
      body: Center(
        child: Text(
          'Favorites Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
