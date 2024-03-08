import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/pages/doctors_profile/doctors_profile.dart';
import 'package:health_coach/pages/home_page/homepage.dart';
import 'package:health_coach/pages/home_page/homepage_test.dart';

import 'package:health_coach/pages/situation_test/test_result.dart';
import 'package:health_coach/pages/user_profile/user_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Inter",
          ),
          home: HomePageTest(),
        );
      },
    );
  }
}
