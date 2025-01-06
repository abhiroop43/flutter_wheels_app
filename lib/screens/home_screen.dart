import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/screens/categories_screen.dart';
import 'package:flutter_wheels_app/screens/favorites_screen.dart';
import 'package:flutter_wheels_app/screens/filters_screen.dart';
import 'package:flutter_wheels_app/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  final String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  static const screenNames = ['Categories', 'Favorites'];

  void _setScreen(String identifier) async {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    if (identifier == 'filters') {
      final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (context) {
        return FiltersScreen();
      }));
      debugPrint('Filters: $result');
    } else if (identifier == 'categories' && widget.routeName != '/home') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    } else if (identifier == 'categories' && widget.routeName == '/home') {
      setState(() {
        currentPageIndex = 0;
      });
    }
  }

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
      drawer: AppDrawer(
        setScreen: _setScreen,
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
