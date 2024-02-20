import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:http/http.dart' as http;

import '../../models/car_model.dart';

class FetchDataCarModelsScreen extends StatefulWidget {
  const FetchDataCarModelsScreen({super.key});

  @override
  State<FetchDataCarModelsScreen> createState() => _FetchDataCarModelsScreenState();
}

class _FetchDataCarModelsScreenState extends State<FetchDataCarModelsScreen> {
  CarModel? userModel;
  List<CarModel> cars = [];

  bool isLoading = true;

  Future<void> _fetchSingleUserData(int id) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"),
      );
      if (response.statusCode == 200) {
        userModel = CarModel.fromJson(jsonDecode(response.body));
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
    _fetchSingleUserData(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Fetch Data"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          if (userModel != null)
            ListTile(
              title: Text("rkjd "),
              // subtitle: Text(userModel!.userId.toString()),
              // trailing: Text(userModel!.id.toString()),
            )
        ],
      ),
    );
  }
}