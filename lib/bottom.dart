import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/images/app_images.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.c_EFF5FB,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(AppImages.home)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(AppImages.search)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(AppImages.shop)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(AppImages.profile)),

        ],
      ),
    );
  }
}
