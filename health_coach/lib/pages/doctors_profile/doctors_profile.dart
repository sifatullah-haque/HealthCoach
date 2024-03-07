import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/const/userProfile_const/userProfile_const.dart';
import 'package:health_coach/pages/situation_test/test_result.dart';

class DoctorsProfile extends StatelessWidget {
  const DoctorsProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloris.backgroundColor,
      appBar: AppBar(
        backgroundColor: Coloris.backgroundColor,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/profile6.png",
                  height: 150.h,
                ),
                SizedBox(height: 15.h),
                Text("Dr. Ifram Dewan",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20.sp)),
                Text("Professor"),
                Text("MBBS(DU), FCPS, MD"),
              ],
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: DefaultTabController(
                length: 4, // Number of tabs
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: Coloris.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 0,
                      labelStyle: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: Coloris.green,
                      ),
                      splashBorderRadius: BorderRadius.circular(10),
                      tabs: const [
                        Tab(text: "Details"),
                        Tab(text: "Review"),
                        Tab(text: "Blog"),
                        Tab(text: "More"),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for "Details" tab
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TwoButtonDoctorPage(),
                                SizedBox(height: 15.h),
                                DoctorsInformation(
                                  HospitalName: "Apollo Hospital",
                                  Designation: "Professor",
                                  Department: "Psychology",
                                  Experience: "2 Years",
                                ),
                                SizedBox(height: 25.h),
                                DoctorsInformation(
                                  HospitalName:
                                      "Dhaka Medical College Hospital",
                                  Designation: "Officer",
                                  Department: "Medicine",
                                  Experience: "6 Months",
                                ),
                                SizedBox(height: 25.h),
                                DoctorsInformation(
                                  HospitalName: "Popular Hospital",
                                  Designation: "Professor",
                                  Department: "Psychology",
                                  Experience: "5 Years",
                                ),
                                SizedBox(height: 25.h),
                                Center(
                                    child: button(
                                        text: "Talk With Doctor", size: 250))
                              ],
                            ),
                          ),
                          // Content for "Follow" tab
                          Container(
                            child: Column(
                              children: [],
                            ),
                          ),
                          // Content for "Blog" tab
                          Container(
                            child: Center(
                              child: Column(
                                children: [],
                              ),
                            ),
                          ),
                          // Content for "More" tab
                          Container(
                            child: Center(
                              child: Text("More Tab Content"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorsInformation extends StatelessWidget {
  final String HospitalName;
  final String Designation;
  final String Department;
  final String Experience;
  const DoctorsInformation({
    super.key,
    required this.HospitalName,
    required this.Designation,
    required this.Department,
    required this.Experience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(HospitalName,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Coloris.liteGrey)),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Designation",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey[500])),
                SizedBox(height: 5.h),
                Text(Designation,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Coloris.text)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Department",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey[500])),
                SizedBox(height: 5.h),
                Text(Department,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Coloris.text)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Experience",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey[500])),
                SizedBox(height: 5.h),
                Text(Experience,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Coloris.green)),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class TwoButtonDoctorPage extends StatelessWidget {
  const TwoButtonDoctorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Coloris.green,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("৳100",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                              color: Coloris.green,
                            )),
                        SizedBox(width: 5.w),
                        Text("(inct. vat)"),
                      ],
                    ),
                    Text("Single Consultation",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              )),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Coloris.green,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("৳900",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                              color: Coloris.green,
                            )),
                        SizedBox(width: 5.w),
                        Text("(inct. vat)"),
                      ],
                    ),
                    Text("10 Consultation",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
