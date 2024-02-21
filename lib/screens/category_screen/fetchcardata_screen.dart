import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:http/http.dart' as http;

import '../../models/car_model.dart';

class FetchCarDataScreen extends StatefulWidget {
  const FetchCarDataScreen({
    super.key,
  });

  @override
  State<FetchCarDataScreen> createState() => _FetchDataCarModelsState();
}

class _FetchDataCarModelsState extends State<FetchCarDataScreen> {
  CarModel? carModel;
  bool isLoading = true;
  List<CarModel> cars = [];

  Future<CarModel?> _fetchData(int id) async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies$id"),
      );
      if (response.statusCode == 200) {
        return CarModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      throw Exception();
    }
  }

  @override
  void initState() {
    _fetchData(4);
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
      body: Column(
        children: [
          FutureBuilder<CarModel?>(
            future: _fetchData(4),
            builder: (
            BuildContext context,
            AsyncSnapshot<CarModel?> snapshot,)
            {
            if(snapshot.data!=null){
            CarModel carModel = snapshot.data as CarModel;
            return ListTile(
              title: Text(carModel.car_model),

            );
            }
            else{
              return Center(child: const CircularProgressIndicator());
            }

            }

            ),
        ],
      ),
    );
  }
}
