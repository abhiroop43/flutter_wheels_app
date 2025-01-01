import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:transparent_image/transparent_image.dart';

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
        title: Text(widget.vehicle.name,
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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.vehicle.imageUrl),
              fit: BoxFit.cover,
              height: 400,
              width: double.infinity,
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Brand'),
                    trailing: Text(widget.vehicle.brand),
                  ),
                  ListTile(
                    title: Text('Year'),
                    trailing: Text(widget.vehicle.year.toString()),
                  ),
                  ListTile(
                    title: Text('Price'),
                    trailing: Text(
                        '\$${widget.vehicle.priceInUsd.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text('Fuel Type'),
                    trailing: Text(widget.vehicle.fuelType.name.toUpperCase()),
                  ),
                  ListTile(
                    title: Text('Transmission'),
                    trailing: Text(widget.vehicle.transmissionType.name),
                  ), // TODO: show English value
                  ListTile(
                    title: Text('Engine Capacity'),
                    trailing:
                        Text('${widget.vehicle.engineCapacityInLiters} L'),
                  ),
                  ListTile(
                    title: Text('Seating Capacity'),
                    trailing: Text('${widget.vehicle.seatingCapacity} seats'),
                  ),
                  ListTile(
                    title: Text('Mileage'),
                    trailing: Text('${widget.vehicle.mileageInKmpl} km/l'),
                  ),
                  ListTile(
                    title: Text('Categories'),
                    trailing: Text(widget.vehicle.categoryIds.join(', ')),
                  ), // TODO: show actual category names
                  ListTile(
                    title: Text('Production Status'),
                    trailing: Text(widget.vehicle.productionStatus.name),
                  ), // TODO: show English value
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
