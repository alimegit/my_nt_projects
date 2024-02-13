import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children:
      [
        SizedBox(height: 200.h,),
        Padding(
          padding:  EdgeInsets.only(left: 24.w,right: 24.w),
          child: TextField(
            decoration: InputDecoration(
              suffix: IconButton(onPressed: (){}, icon:const  Icon(Icons.add_card_sharp)),
                fillColor: AppColors.transparent,
                filled: true,
                hintText:"Password",
                hintStyle: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_AEA8B2,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                     color: AppColors.c_AEA8B2,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.c_AEA8B2,
                    ),
                  borderRadius: BorderRadius.circular(12.r)
                )
            ),
          ),
        ),
        SizedBox(height: 8.h,) ,
        Padding(
          padding:  EdgeInsets.only(left: 24.w,right: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.check_box)),
             const  Text("Forgot Password?",style: TextStyle(color: AppColors.c_1A72DD),)
            ],
          ),
        ),
      ],
      ),
    );
  }
}
