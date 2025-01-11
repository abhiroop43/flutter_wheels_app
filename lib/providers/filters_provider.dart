import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/models/filter.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';
import 'package:flutter_wheels_app/providers/vehicles_provider.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.fuelElectric: false,
          Filter.transAutomatic: false,
        });

  void setAllFilters(Map<Filter, bool> allFilters) {
    state = allFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredVehiclesProvider = Provider((ref) {
  final vehicles = ref.watch(vehiclesProvider);
  final activeFilters = ref.watch(filtersProvider);

  return vehicles.where((vehicle) {
    if (activeFilters[Filter.fuelElectric]! &&
        vehicle.fuelType != FuelType.electric) {
      return false;
    }
    if (activeFilters[Filter.transAutomatic]! &&
        vehicle.transmissionType != TransmissionType.automatic) {
      return false;
    }
    return true;
  }).toList();
});
