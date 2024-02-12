import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Ali",style: TextStyle(color: AppColors.white),),
      ),
      body: Center(
        child: Text("Ali",style: TextStyle(color: AppColors.c_1A72DD),),
      ),
    );
  }
}
