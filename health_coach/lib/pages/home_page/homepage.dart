import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/const/homepage_const/homepage_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloris.backgroundColor,
      appBar: AppBar(
        backgroundColor: Coloris.backgroundColor,
        surfaceTintColor: Coloris.backgroundColor,
        foregroundColor: Coloris.backgroundColor,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              //header part goes here
              const HeaderFile(),
              SizedBox(height: 20.h),
              Image.asset("assets/images/banner1.png"),
              SizedBox(height: 15.h),
              const HeroBanners(),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "See Active Doctors",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Coloris.text,
                    ),
                  ),
                  const Text("See More"),
                ],
              ),
              SizedBox(height: 15.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const ActiveDoctorList(
                      image: "blog1.png",
                      name: "Dr. Ifram Dewan",
                      previousPrice: " ৳850",
                      currentPrice: " ৳99",
                    ),
                    SizedBox(width: 20.w),
                    const ActiveDoctorList(
                      image: "blog2.png",
                      name: "Dr. Sifatullah Haque",
                      previousPrice: " ৳999",
                      currentPrice: " ৳160",
                    ),
                    SizedBox(width: 20.w),
                    const ActiveDoctorList(
                      image: "blog3.png",
                      name: "Dr. Khairul Begum",
                      previousPrice: " ৳550",
                      currentPrice: " ৳150",
                    ),
                    SizedBox(width: 20.w),
                    const ActiveDoctorList(
                      image: "blog1.png",
                      name: "Dr. Dewan Raj",
                      previousPrice: " ৳450",
                      currentPrice: " ৳230",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Coloris.text,
                ),
              ),
              SizedBox(height: 15.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBox(
                    image: "cat7.jpg",
                    text: "Cardiology",
                  ),
                  ContainerBox(
                    image: "cat1.jpg",
                    text: "Cardiology",
                  ),
                  ContainerBox(
                    image: "cat2.jpg",
                    text: "Cardiology",
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerBox(
                    image: "cat3.jpg",
                    text: "Cardiology",
                  ),
                  ContainerBox(
                    image: "cat4.jpg",
                    text: "Cardiology",
                  ),
                  ContainerBox(
                    image: "cat6.jpg",
                    text: "Cardiology",
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              Text("Recommended For You",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Coloris.liteGrey,
                  )),
              SizedBox(height: 10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const RecommendedOptions(
                      images: "focus.png",
                      title: "Focus",
                      subtitle: "Meditation",
                      time: " . 5-10 min",
                      color: Color(0xffAFDBC5),
                    ),
                    SizedBox(width: 20.w),
                    const RecommendedOptions(
                      images: "Happiness.png",
                      title: "Happiness",
                      subtitle: "Meditation",
                      time: ". 3-5 min",
                    ),
                    SizedBox(width: 20.w),
                    const RecommendedOptions(
                      images: "focus.png",
                      title: "Motivation",
                      subtitle: "Exercise",
                      time: " . 10-12 min",
                      color: Color(0xffAFDBC5),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
