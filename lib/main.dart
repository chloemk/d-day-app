import 'package:d_day_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'D-Day',
          theme: ThemeData(
            fontFamily: 'sunflower',
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 70.sp,
                fontFamily: 'parisienne',
              ),
              headline2: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 45.sp,
              ),
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 25.sp,
              ),
              bodyText2: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
