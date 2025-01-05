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
  // fix: dismiss the snackbar as soon as user navigates to another screen
  late ScaffoldMessengerState scaffoldMessenger;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scaffoldMessenger = ScaffoldMessenger.of(context);
  }

  @override
  void dispose() {
    scaffoldMessenger.hideCurrentSnackBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var labelStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.primary);

    var valueStyle = Theme.of(context)
        .textTheme
        .labelMedium!
        .copyWith(color: Theme.of(context).colorScheme.tertiary);

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

                final successSnackBar = SnackBar(
                  content: widget.vehicle.isFavorite
                      ? const Text('Marked as a favorite')
                      : const Text('Removed from favorites'),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          widget.vehicle.toggleFavorite();
                        });
                      }
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
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
                    title: Text(
                      'Brand',
                      style: labelStyle,
                    ),
                    trailing: Text(widget.vehicle.brand, style: valueStyle),
                  ),
                  ListTile(
                    title: Text(
                      'Year',
                      style: labelStyle,
                    ),
                    trailing: Text(widget.vehicle.year.toString()),
                  ),
                  ListTile(
                    title: Text(
                      'Price',
                      style: labelStyle,
                    ),
                    trailing: Text(
                        '\$${widget.vehicle.priceInUsd.toStringAsFixed(2)}'),
                  ),
                  ListTile(
                    title: Text(
                      'Fuel Type',
                      style: labelStyle,
                    ),
                    trailing: Text(widget.vehicle.fuelType.name.toUpperCase()),
                  ),
                  ListTile(
                    title: Text(
                      'Transmission',
                      style: labelStyle,
                    ),
                    trailing: Text(widget.vehicle.transmissionType.name),
                  ), // TODO: show English value
                  ListTile(
                    title: Text(
                      'Engine Capacity',
                      style: labelStyle,
                    ),
                    trailing:
                        Text('${widget.vehicle.engineCapacityInLiters} L'),
                  ),
                  ListTile(
                    title: Text(
                      'Seating Capacity',
                      style: labelStyle,
                    ),
                    trailing: Text('${widget.vehicle.seatingCapacity} seats'),
                  ),
                  ListTile(
                    title: Text(
                      'Mileage',
                      style: labelStyle,
                    ),
                    trailing: Text('${widget.vehicle.mileageInKmpl} km/l'),
                  ),
                  ListTile(
                    title: Text(
                      'Categories',
                      style: labelStyle,
                    ),
                    trailing: Text(widget.vehicle.categoryIds.join(', ')),
                  ), // TODO: show actual category names
                  ListTile(
                    title: Text(
                      'Production Status',
                      style: labelStyle,
                    ),
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
