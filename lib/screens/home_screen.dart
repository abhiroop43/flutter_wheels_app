import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/models/category.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/providers/vehicles_provider.dart';
import 'package:flutter_wheels_app/screens/categories_screen.dart';
import 'package:flutter_wheels_app/screens/favorites_screen.dart';
import 'package:flutter_wheels_app/screens/filters_screen.dart';
import 'package:flutter_wheels_app/widgets/app_drawer.dart';

const kVehicleInitFilter = {
  Filter.fuelElectric: false,
  Filter.transAutomatic: false,
};

class HomeScreen extends ConsumerStatefulWidget {
  final String routeName = '/home';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentPageIndex = 0;

  Map<Filter, bool> vehicleFilters = {};

  static const screenNames = ['Categories', 'Favorites'];

  @override
  void initState() {
    super.initState();
    vehicleFilters = kVehicleInitFilter;
  }

  void _setScreen(String identifier) async {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    if (identifier == 'filters') {
      final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (context) {
        return FiltersScreen(
          savedFilters: vehicleFilters,
        );
      }));

      setState(() {
        vehicleFilters = result ?? kVehicleInitFilter;
      });
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

  List<Vehicle> _getFilteredVehicles(List<Vehicle> vehicles) {
    return vehicles.where((vehicle) {
      if (vehicleFilters[Filter.fuelElectric]! &&
          vehicle.fuelType != FuelType.electric) {
        return false;
      }
      if (vehicleFilters[Filter.transAutomatic]! &&
          vehicle.transmissionType != TransmissionType.automatic) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final allVehicles = ref.watch(vehiclesProvider);

    List<Category> categories = Category.getCategories();
    List<Vehicle> vehicles = _getFilteredVehicles(allVehicles);

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
        CategoriesScreen(
          categories: categories,
          vehicles: vehicles,
        ),

        // favorites screen
        FavoritesScreen()
      ][currentPageIndex],
    );
  }
}
