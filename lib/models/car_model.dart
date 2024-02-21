import 'package:flutter/material.dart';

class CarModel {
  final int id;
  final String car_model;
  final int average_price;
  final String logo;
  final int established_year;

  CarModel({
    required this.id,
    required this.car_model,
    required this.average_price,
    required this.established_year,
    required this.logo,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json["id"] as int? ?? 0,
      car_model: json["car_model"] as String? ?? "",
      average_price: json["average_price"] as int? ?? 0,
      logo: json["logo"] as String? ?? "",
      established_year: json["established_year"] as int? ?? 0,
    );
  }
}
