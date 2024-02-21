import 'package:flutter/material.dart';

import 'car_model.dart';
class CarInfo {
  final List<CarModel> data;

  CarInfo({
    required this.data,
  });

  factory CarInfo.fromJson(Map<String, dynamic> json) {
    return CarInfo(
      data: (json["data"] as List?)
          ?.map((e) => CarModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}