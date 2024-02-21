import 'package:flutter/material.dart';

class CarInfoModel {
  final int id;
  final List<String> car_pics;
  final String car_model;
  final int average_price;
  final String logo;
  final int established_year;
  final String description;

  CarInfoModel({
    required this.car_pics,
    required this.description,
    required this.id,
    required this.car_model,
    required this.average_price,
    required this.established_year,
    required this.logo,
  });

  factory CarInfoModel.fromJson(Map<String, dynamic> json) {
    return CarInfoModel(
      id: json["id"] as int? ?? 0,
      car_model: json["car_model"] as String? ?? "",
      average_price: json["average_price"] as int? ?? 0,
      logo: json["logo"] as String? ?? "",
      established_year: json["established_year"] as int? ?? 0,
      description: json["description"] as String? ?? "",
      car_pics:(json["car_pics"] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}
