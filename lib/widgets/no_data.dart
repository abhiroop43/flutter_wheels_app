import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String label;
  const NoData({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
