import 'package:flutter/material.dart';

class VehicleStatItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const VehicleStatItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
