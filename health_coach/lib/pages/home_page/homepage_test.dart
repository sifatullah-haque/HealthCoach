import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/home_page/homepage.dart';
import 'package:health_coach/pages/login_signup/login.dart';
import 'package:health_coach/pages/situation_test/situation_test.dart';
import 'package:health_coach/pages/situation_test/test_result.dart';
import 'package:health_coach/pages/user_profile/user_profile.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({Key? key}) : super(key: key);

  @override
  State<HomePageTest> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTest> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SituationTest(),
    TestResult(),
    SituationTest(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home, size: 30.h),
          Icon(Icons.message_rounded, size: 30.h),
          Icon(Icons.landscape_rounded, size: 30.h),
          Icon(Icons.library_music_rounded, size: 30.h),
          Icon(Icons.person, size: 30.h),
        ],
        color: Colors.green.shade300,
        buttonBackgroundColor: Colors.green.shade300,
        backgroundColor: Coloris.backgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        height: 75.h,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
