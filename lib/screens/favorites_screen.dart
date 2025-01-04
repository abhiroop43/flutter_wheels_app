import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/widgets/no_data.dart';
import 'package:flutter_wheels_app/widgets/vehicle_list_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Vehicle>>(
      valueListenable: Vehicle.favoriteVehiclesNotifier,
      builder: (context, favoriteVehicles, child) {
        return Container(
          padding: EdgeInsets.all(8),
          child: favoriteVehicles.isNotEmpty
              ? ListView.builder(
                  itemCount: favoriteVehicles.length,
                  itemBuilder: (context, index) {
                    return VehicleListItem(
                        vehicles: favoriteVehicles, index: index);
                  },
                )
              : NoData(label: 'You have no favorites (yet)'),
        );
      },
    );
  }
}
