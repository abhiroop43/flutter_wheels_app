import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    this.color = Colors.deepPurpleAccent,
  });

  static List<Category> getCategories() {
    List<Category> categories = [];

    categories.add(Category(id: 'c1', name: 'SUV', color: Colors.purple));
    categories.add(Category(id: 'c2', name: 'Sedan', color: Colors.blue));
    categories.add(Category(id: 'c3', name: 'Hatchback', color: Colors.red));
    categories
        .add(Category(id: 'c4', name: 'Convertible', color: Colors.orange));
    categories
        .add(Category(id: 'c5', name: 'Pickup Truck', color: Colors.green));
    categories.add(Category(id: 'c6', name: 'Coupe', color: Colors.teal));
    categories.add(Category(id: 'c7', name: 'Minivan', color: Colors.brown));
    categories
        .add(Category(id: 'c8', name: 'Station Wagon', color: Colors.cyan));
    categories.add(Category(id: 'c9', name: 'Sports Car', color: Colors.amber));
    categories
        .add(Category(id: 'c10', name: 'Electric', color: Colors.lightBlue));
    categories.add(Category(id: 'c11', name: 'Diesel', color: Colors.grey));
    categories.add(Category(id: 'c12', name: 'Hybrid', color: Colors.lime));

    return categories;
  }
}
