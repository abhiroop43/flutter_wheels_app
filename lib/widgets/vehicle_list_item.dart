import 'package:flutter/material.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:transparent_image/transparent_image.dart';

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
    return Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        child: InkWell(
            onTap: () {},
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(vehicles[index].imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                      child: Column(
                        children: [
                          Text(
                            vehicles[index].name,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ))
              ],
            )));

    // return ListTile(
    //   title: Text(vehicles[index].name),
    //   subtitle: Text(vehicles[index].brand),
    //   leading: CircleAvatar(
    //     backgroundImage: NetworkImage(vehicles[index].imageUrl),
    //   ),
    // );
  }
}
