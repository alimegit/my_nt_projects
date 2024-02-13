import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/bottom.dart';
import 'package:flutter_nt_ten/screens/secondpage.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/product_category.dart';
import '../utils/styles/app_text_style.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
  List<ProductCategory> categories = [
    ProductCategory.all,
    ProductCategory.Computers,
    ProductCategory.Smartphones,
    ProductCategory.Accesories,
    ProductCategory.Speakers,
    ProductCategory.Smartobjects,
    ProductCategory.Magazin,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              }));
            },
            icon: SvgPicture.asset(AppImages.back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Text(
              "Categories",
              style: TextStyle(
                  color: AppColors.c_0A1034,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  ...List.generate(
                    categories.length,
                    (index) => TextButton(
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        height: 72.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.1,
                              blurRadius: 0.1,
                              offset: Offset(0, 1), // Ko'rsatkich
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index].name,
                            style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.c_0A1034, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigator(),
        ],
      ),
    );
  }
}
/*

 */
