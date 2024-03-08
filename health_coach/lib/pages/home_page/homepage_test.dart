import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/community/community.dart';
import 'package:health_coach/pages/home_page/homepage.dart';

import 'package:health_coach/pages/meditation/meditation.dart';
import 'package:health_coach/pages/messages/messages.dart';

import 'package:health_coach/pages/user_profile/user_profile.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({Key? key}) : super(key: key);

  @override
  State<HomePageTest> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageTest> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Messages(),
    const meditation(),
    const Community(),
    const UserProfile(),
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
          Icon(Icons.groups_outlined, size: 30.h),
          Icon(Icons.person, size: 30.h),
        ],
        color: Colors.green.shade300,
        buttonBackgroundColor: Colors.green.shade300,
        backgroundColor: Coloris.backgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        height: 75.h,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
