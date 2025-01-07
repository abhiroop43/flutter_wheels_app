import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';

final vehiclesProvider = Provider((ref) {
  return Vehicle.getVehicles();
});
