import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/screens/categories_screen.dart';
import 'package:flutter_wheels_app/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  static const screenNames = ['Categories', 'Favorites'];

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.getCategories();

    return Scaffold(
      appBar: AppBar(
        title: Text(screenNames[currentPageIndex],
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: 32,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Vrooom!!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer)),
                    ],
                  ),
                )),
            ListTile(
              leading: const Icon(Icons.select_all),
              title: const Text('Vehicles'),
              onTap: () {
                // TODO: show all vehicles
              },
            ),
            ListTile(
              leading: const Icon(Icons.filter_alt),
              title: const Text('Filters'),
              onTap: () {
                // TODO: show filters
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 68,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            label: screenNames[0],
            selectedIcon: Icon(Icons.category),
          ),
          NavigationDestination(
            icon: Icon(Icons.star_outline),
            label: screenNames[1],
            selectedIcon: Icon(Icons.star),
          )
        ],
        indicatorColor: Theme.of(context).colorScheme.surfaceBright,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: <Widget>[
        // categories view
        CategoriesScreen(categories: categories),

        // favorites screen
        FavoritesScreen()
      ][currentPageIndex],
    );
  }
}
