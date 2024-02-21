import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../models/company_info.dart';
import '../models/infos_model.dart';

class CarsInfoScreen extends StatefulWidget {
  const CarsInfoScreen({super.key, required this.id});

  final int id;

  @override
  State<CarsInfoScreen> createState() => _CarsInfoScreenState();
}

class _CarsInfoScreenState extends State<CarsInfoScreen> {
  Future<CarInfoModel?> _fetchData() async {
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(
            "https://easyenglishuzb.free.mockoapp.net/companies/${widget.id}"),
      );
      if (response.statusCode == 200) {
        print(response.body);
        return CarInfoModel.fromJson(
          jsonDecode(response.body),
        );
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
        backgroundColor: AppColors.c_F4261A,
        centerTitle: true,
        title: Text(
          "Ma'lumot",
          style: AppTextStyle.interSemiBold.copyWith(color: AppColors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),),
      ),
      body: FutureBuilder<CarInfoModel?>(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot<CarInfoModel?> data) {
            if (data.data != null) {
              CarInfoModel carInfoModel = data.data as CarInfoModel;
              return Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                            carInfoModel.car_pics.length,
                            (index) => Image.network(
                              carInfoModel.car_pics[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(20.w.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ID:${carInfoModel.id}",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),
                              ),
                              Text(
                                "Car Model:${carInfoModel.car_model}",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),
                              ),
                              Text(
                                "Established Year:${carInfoModel.established_year}",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),
                              ),
                              Text(
                                "Average Price:${carInfoModel.average_price}",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "Description:\n${carInfoModel.description}",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (data.hasError) {
              return Center(
                child: Center(child: Text("Error")),
              );
            } else {
              return Center(child: CircularProgressIndicator.adaptive());
            }
          }),
    );
  }
}
