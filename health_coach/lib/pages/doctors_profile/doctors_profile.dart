import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/const/userProfile_const/userProfile_const.dart';
import 'package:health_coach/pages/messages/messages.dart';
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
                const Text("Professor"),
                const Text("MBBS(DU), FCPS, MD"),
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
                            child: DetailsDoctorTabBar(),
                          ),
                          // Content for "Follow" tab
                          Container(
                            child: Column(
                              children: [
                                const DoctorReviewPart(
                                  image: "profile1.png",
                                  review:
                                      "Dr. Ifram Dewan is a very good doctor. He is very friendly and helpful. ",
                                  rating: "4.5",
                                ),
                                SizedBox(height: 15.h),
                                const DoctorReviewPart(
                                  image: "profile2.png",
                                  review:
                                      "He's is a very good doctor.I am very happy with his treatment.",
                                  rating: "4.5",
                                ),
                                SizedBox(height: 15.h),
                                const DoctorReviewPart(
                                  image: "profile3.png",
                                  review:
                                      "He's Not to good neither to bad. He listed to me very carefully.",
                                  rating: "4.5",
                                ),
                                SizedBox(height: 15.h),
                                const DoctorReviewPart(
                                  image: "profile4.png",
                                  review:
                                      "I'm pretty much happy with his behaviour and treatment. thank you.",
                                  rating: "4.5",
                                ),
                                SizedBox(height: 15.h),
                                const button(
                                  text: "Talk With Doctor",
                                  size: 250,
                                  destinationType: "push",
                                  destination: Messages(),
                                )
                              ],
                            ),
                          ),
                          // Content for "Blog" tab
                          Container(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SectionWithGreenBorder(
                                      text: "Written by Dr. Ifram"),
                                  SizedBox(height: 15.h),
                                  DoctorsBlog(
                                    image: "blog1.png",
                                    title: "What if you fall in love",
                                    description:
                                        "Falling in love is part of life. Being in love is not a ...",
                                    color: Coloris.green,
                                  ),
                                  SizedBox(height: 15.h),
                                  DoctorsBlog(
                                    image: "blog1.png",
                                    title: "It's Okay to be sad",
                                    description:
                                        "Being Same make us way more strong. There are ...",
                                  ),
                                  SizedBox(height: 15.h),
                                  DoctorsBlog(
                                    image: "blog1.png",
                                    title: "How to be Happy?",
                                    description:
                                        "Happiness lies into our mind. Here are ...",
                                  ),
                                  SizedBox(height: 15.h),
                                  const Center(
                                    child: button(
                                      text: "Talk With Doctor",
                                      size: 250,
                                      destinationType: "push",
                                      destination: Messages(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Content for "More" tab
                          Container(
                            child: const Center(
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

class DoctorReviewPart extends StatelessWidget {
  final String image;
  final String review;
  final String rating;
  const DoctorReviewPart({
    super.key,
    required this.image,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
            radius: 48.h,
            backgroundColor: Coloris.liteGreen,
            child: CircleAvatar(
              radius: 46.h,
              backgroundImage: AssetImage("assets/images/$image"),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            review,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Coloris.text,
            ),
            overflow: TextOverflow.clip,
          ),
        ),
        Expanded(
          flex: 1,
          child: buttonSecond(
            text: rating,
            size: 50,
          ),
        )
      ],
    );
  }
}

class DetailsDoctorTabBar extends StatelessWidget {
  const DetailsDoctorTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TwoButtonDoctorPage(),
        SizedBox(height: 15.h),
        const DoctorsInformation(
          HospitalName: "Apollo Hospital",
          Designation: "Professor",
          Department: "Psychology",
          Experience: "2 Years",
        ),
        SizedBox(height: 25.h),
        const DoctorsInformation(
          HospitalName: "Dhaka Medical College Hospital",
          Designation: "Officer",
          Department: "Medicine",
          Experience: "6 Months",
        ),
        SizedBox(height: 25.h),
        const DoctorsInformation(
          HospitalName: "Popular Hospital",
          Designation: "Professor",
          Department: "Psychology",
          Experience: "5 Years",
        ),
        SizedBox(height: 25.h),
        const Center(
            child: button(
          text: "Talk With Doctor",
          size: 250,
          destinationType: "push",
          destination: Messages(),
        ))
      ],
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
