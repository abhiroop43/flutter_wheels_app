import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';

class VehiclesDetailsScreen extends StatefulWidget {
  final Vehicle vehicle;
  const VehiclesDetailsScreen({super.key, required this.vehicle});

  @override
  State<VehiclesDetailsScreen> createState() => _VehiclesDetailsScreenState();
}

class _VehiclesDetailsScreenState extends State<VehiclesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Details',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
              icon: widget.vehicle.isFavorite
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
              onPressed: () {
                setState(() {
                  widget.vehicle.toggleFavorite();
                });
              },
            ),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Text(
            '${widget.vehicle.name} details ${widget.vehicle.isFavorite}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer)),
      ),
    );
  }
}
