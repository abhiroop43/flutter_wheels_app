import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/widgets/no_data.dart';
import 'package:flutter_wheels_app/widgets/vehicle_list_item.dart';

class VehiclesScreen extends StatelessWidget {
  final String title;
  final List<Vehicle> vehicles;

  const VehiclesScreen(
      {super.key, required this.title, required this.vehicles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer)),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer),
      body: Container(
        padding: EdgeInsets.all(8),
        child: vehicles.isNotEmpty
            ? ListView.builder(
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  return VehicleListItem(vehicles: vehicles, index: index);
                },
              )
            : NoData(label: 'No vehicles found'),
      ),
    );
  }
}
