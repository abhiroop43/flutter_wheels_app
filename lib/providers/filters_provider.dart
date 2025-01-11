import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/models/filter.dart';

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
