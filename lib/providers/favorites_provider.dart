  import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/models/vehicle.dart';

class FavoritesNotifier extends StateNotifier<List<Vehicle>> {
  FavoritesNotifier() : super([]);

  bool toggleFavorite(Vehicle vehicle) {
    final index = state.indexWhere((v) => v.id == vehicle.id);

    if (index == -1) {
      state = [...state, vehicle];
      vehicle.isFavorite = true;
      return true;
    } else {
      state = List.from(state)..removeAt(index);
      vehicle.isFavorite = false;
      return false;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Vehicle>>(
        (ref) => FavoritesNotifier());
