import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:http/http.dart' as http;

import '../../models/car_model.dart';

class FetchDataCarModelsScreen extends StatefulWidget {
  const FetchDataCarModelsScreen({
    super.key,
  });

  @override
  State<FetchDataCarModelsScreen> createState() => _FetchDataCarModelsState();
}

class _FetchDataCarModelsState extends State<FetchDataCarModelsScreen> {
  CarModel? carModel;
  bool isLoading = true;
  List<CarModel> cars = [];

  Future<void> _fetchData() async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies}"),
      );
      if (response.statusCode == 200) {
        carModel = CarModel.fromJson(jsonDecode(response.body));
        isLoading = false;
        setState(() {});
      }
    } catch (error) {
      isLoading = false;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.toString(),
            ),
          ),
        );
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  // https://easyenglishuzb.free.mockoapp.net/companies
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.c_C4C4C4,
        title: Text(
          "Fetching Categories",
          style: AppTextStyle.interBold.copyWith(color: AppColors.black),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                        ...List.generate(
                          cars.length,
                          (index) {
                            return Container(
                              decoration: BoxDecoration(color: Colors.red),
                              child: Column(
                                children: [
                                  Text(cars[index].average_price.toString()),
                                  Text("${cars[index].id}"),
                                  Image.network(cars[index].logo),
                                  // Text(cars[index].average_price.toString()),
                                ],
                              ),
                            );
                          },
                        ),
                    ],
                  ),
    );
  }
}
