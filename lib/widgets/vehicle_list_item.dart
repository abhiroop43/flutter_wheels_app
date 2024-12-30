import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';

class VehicleListItem extends StatelessWidget {
  final int index;
  const VehicleListItem({
    super.key,
    required this.vehicles,
    required this.index,
  });

  final List<Vehicle> vehicles;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(vehicles[index].name),
      subtitle: Text(vehicles[index].brand),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(vehicles[index].imageUrl),
      ),
    );
  }
}
