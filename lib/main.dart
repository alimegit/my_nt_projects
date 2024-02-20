import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/category_screen/categories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helloscreen.dart';
import 'models/company_info.dart';
void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(414, 896),
      builder: (context,child){
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
    },child:  FetchDataCarModelsScreen(),
    );
  }
}
