import 'package:flutter/material.dart';

enum FuelType { petrol, diesel, electric, hybrid }

enum TransmissionType { manual, automatic, cvt }

enum ProductionStatus { concept, prototype, massProduced, decommissioned }

class Vehicle {
  final String id;
  final String name;
  final String brand;
  final List<String> categoryIds;
  final int year;
  final double priceInUsd;
  final FuelType fuelType;
  final double engineCapacityInLiters;
  final int seatingCapacity;
  final double mileageInKmpl;
  final Color color;
  final TransmissionType transmissionType;
  final String imageUrl;
  final ProductionStatus productionStatus;
  bool isFavorite = false;

  Vehicle({
    required this.id,
    required this.name,
    required this.brand,
    required this.categoryIds,
    required this.year,
    required this.priceInUsd,
    required this.fuelType,
    required this.engineCapacityInLiters,
    required this.seatingCapacity,
    required this.mileageInKmpl,
    required this.color,
    required this.transmissionType,
    required this.imageUrl,
    required this.productionStatus,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  static List<Vehicle> getVehicles() {
    List<Vehicle> vehicles = [];

    vehicles.add(Vehicle(
      id: 'v1',
      name: 'Camry',
      brand: 'Toyota',
      categoryIds: ['c2', 'c12'],
      year: 2023,
      priceInUsd: 60000,
      fuelType: FuelType.hybrid,
      engineCapacityInLiters: 3.5,
      seatingCapacity: 5,
      mileageInKmpl: 18,
      color: Colors.black,
      transmissionType: TransmissionType.cvt,
      imageUrl:
          'https://di-enrollment-api.s3.amazonaws.com/toyota/models/2023/camry-hybrid/2023+Camry+Hybrid/Trims/SE+Hybrid.png',
      productionStatus: ProductionStatus.massProduced,
    ));

    vehicles.add(Vehicle(
      id: 'v2',
      name: 'Model X',
      brand: 'Tesla',
      categoryIds: ['c1', 'c10'], // SUV, Electric
      year: 2023,
      priceInUsd: 120000,
      fuelType: FuelType.electric,
      engineCapacityInLiters: 0.0,
      seatingCapacity: 7,
      mileageInKmpl: 0.0,
      color: Colors.white,
      transmissionType: TransmissionType.automatic,
      imageUrl:
          'https://images.prismic.io/carwow/c340a77d-af56-4562-abfb-bd5518ccb292_2023+Tesla+Model+X+front+quarter+moving.jpg',
      productionStatus: ProductionStatus.massProduced,
    ));

    vehicles.add(Vehicle(
      id: 'v3',
      name: 'Mustang Mach-E',
      brand: 'Ford',
      categoryIds: ['c1', 'c10'], // SUV, Electric
      year: 2022,
      priceInUsd: 55000,
      fuelType: FuelType.electric,
      engineCapacityInLiters: 0.0,
      seatingCapacity: 5,
      mileageInKmpl: 0.0,
      color: Colors.blue,
      transmissionType: TransmissionType.automatic,
      imageUrl:
          'https://static.wixstatic.com/media/a81051_f78b3eda238f4140841f01022c798c8d~mv2.jpg/v1/fill/w_1000,h_667,al_c,q_85,usm_0.66_1.00_0.01/a81051_f78b3eda238f4140841f01022c798c8d~mv2.jpg',
      productionStatus: ProductionStatus.massProduced,
    ));

    vehicles.add(Vehicle(
      id: 'v4',
      name: 'Cybertruck',
      brand: 'Tesla',
      categoryIds: ['c1', 'c8', 'c10'], // SUV, Pickup, Electric
      year: 2024,
      priceInUsd: 39999.99,
      fuelType: FuelType.electric,
      engineCapacityInLiters: 0.0,
      seatingCapacity: 6,
      mileageInKmpl: 0.0,
      color: Colors.blueGrey[50]!,
      transmissionType: TransmissionType.automatic,
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/2025-tesla-cybertruck-3-672e75cce7814.jpg',
      productionStatus: ProductionStatus.prototype,
    ));

    vehicles.add(Vehicle(
      id: 'v5',
      name: 'Civic Type R',
      brand: 'Honda',
      categoryIds: ['c2', 'c9'], // Sedan, Sports Car
      year: 2023,
      priceInUsd: 43000,
      fuelType: FuelType.petrol,
      engineCapacityInLiters: 2.0,
      seatingCapacity: 4,
      mileageInKmpl: 14.0,
      color: Colors.red,
      transmissionType: TransmissionType.manual,
      imageUrl:
          'https://cdn.motor1.com/images/mgl/ZnyOEo/s3/new-mugen-honda-civic-type-r.jpg',
      productionStatus: ProductionStatus.massProduced,
    ));

    vehicles.add(Vehicle(
      id: 'v6',
      name: 'Sesto Elemento',
      brand: 'Lamborghini',
      categoryIds: ['c9', 'c13'], // Sports Car, Luxury
      year: 2011,
      priceInUsd: 2500000,
      fuelType: FuelType.petrol,
      engineCapacityInLiters: 5.2,
      seatingCapacity: 2,
      mileageInKmpl: 6.0,
      color: Colors.grey,
      transmissionType: TransmissionType.automatic,
      imageUrl:
          'https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/masterpieces/sesto-elemento/sesto-elemento-HEADER.jpg',
      productionStatus: ProductionStatus.decommissioned,
    ));

    return vehicles;
  }
}
