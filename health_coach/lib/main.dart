import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/authPage.dart';
import 'package:health_coach/firebase_options.dart';

import 'package:health_coach/pages/home_page/homepage_test.dart';
import 'package:health_coach/pages/login_signup/login.dart';
import 'package:health_coach/pages/situation_test/situation_test.dart';
import 'package:health_coach/pages/situation_test/test_result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

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
          home: Login(),
        );
      },
    );
  }
}
