import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wheels_app/providers/favorites_provider.dart';
import 'package:flutter_wheels_app/widgets/no_data.dart';
import 'package:flutter_wheels_app/widgets/vehicle_list_item.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesProvider);

    return Container(
      padding: EdgeInsets.all(8),
      child: favorites.isNotEmpty
          ? ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return VehicleListItem(vehicles: favorites, index: index);
              },
            )
          : NoData(label: 'You have no favorites (yet)'),
    );
  }
}
