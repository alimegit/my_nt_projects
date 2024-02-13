import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../models/repo.dart';
import '../utils/images/app_images.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
      body: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Laptop",
              style: TextStyle(
                  color: AppColors.c_0A1034,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ascending price",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          SvgPicture.asset(AppImages.arrow),
                          SizedBox(
                            width: 6.w,
                          ),
                          SvgPicture.asset(AppImages.bottomarrow),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Filters",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SvgPicture.asset(AppImages.bottomarrow),
                    ],
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  SvgPicture.asset(AppImages.all),
                ],
              ),
            ),
            SizedBox(height: 32.h,),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  children: [
                    ...List.generate(products.length, (index) => 
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppImages.computers),
                            SizedBox(height: 12,),
                            Text("Laptop",style: TextStyle(color: AppColors.c_0A1034,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                            Text("USD 999",style: TextStyle(color: AppColors.c_0001FC,fontWeight: FontWeight.w500,fontSize: 16.sp),),
                          ],
                        ),
                      ),
                    ),
                    )
                  ],
            )),
          ],
        ),
      ),
    );
  }
}
