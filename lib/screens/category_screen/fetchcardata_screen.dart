import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/car_info_screen.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool isLoading = true;

  Future<List<CarModel>?> _fetchData() async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body)["data"] as List?)
            ?.map((e) => CarModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
    return null;
  }

  @override
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
      body: FutureBuilder<List<CarModel>?>(
        future: _fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CarModel>?> snapShot) {
          if (snapShot.data != null) {
            List<CarModel> users = snapShot.data as List<CarModel>;
            return ListView(
              children: List.generate(
                users.length,
                    (index) {
                  CarModel carModel = users[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>CarsInfoScreen(id: carModel.id)));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                            color: AppColors.c_C4C4C4,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Image.network(carModel.logo,width: 150,height: 150,)),
                            Padding(
                              padding:  EdgeInsets.only(left: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("CarModel:${carModel.car_model}"),
                                  Text("ID:${carModel.id}"),
                                  Text("AveragePrice${carModel.average_price}"),
                                  Text("established_year:${carModel.established_year}"),
                                ],
                              ),

                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapShot.hasError) {
            return Center(
              child: Text(
                snapShot.hasError.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
