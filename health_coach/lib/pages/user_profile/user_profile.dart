import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/const/userProfile_const/userProfile_const.dart';
import 'package:health_coach/pages/situation_test/test_result.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key});

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
          children: [
            const UserFileHeader(),
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
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Coloris.green,
                      ),
                      splashBorderRadius: BorderRadius.circular(10),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      tabs: const [
                        Tab(text: "Details"),
                        Tab(text: "Follow"),
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
                            child: const DetailsTabBar(),
                          ),
                          // Content for "Follow" tab
                          Container(
                            child: FollowTabBar(),
                          ),
                          // Content for "Blog" tab
                          Container(
                            child: Center(
                              child: BlogTabBar(),
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

class BlogTabBar extends StatelessWidget {
  const BlogTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionWithGreenBorder(text: "From Doctors"),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog1.png",
            title: "What if you fall in love",
            description:
                "Falling in love is part of life. Being in love is not a ...",
          ),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog2.png",
            title: "It's Okay to be sad",
            description: "Being Same make us way more strong. There are ...",
          ),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog3.png",
            title: "How to be Happy?",
            description: "Happiness lies deep into our. Here are kind of ...",
          ),
          SizedBox(height: 15.h),
          const SectionWithGreenBorder(text: "From Consultants"),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog2.png",
            title: "How to be Happy?",
            description: "Happiness lies deep into our. Here are kind of ...",
          ),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog1.png",
            title: "It's Okay to be sad",
            description: "Being Same make us way more strong. There are ...",
          ),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog2.png",
            title: "What if you fall in love",
            description:
                "Falling in love is part of life. Being in love is not a ...",
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class FollowTabBar extends StatelessWidget {
  const FollowTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          const SectionWithGreenBorder(text: "Follow Doctos"),
          SizedBox(height: 15.h),
          const IconUserDoctorWithDesignation(
            image: "profile1.png",
            name: "Dr. Ifram Dewan",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
          ),
          SizedBox(height: 15.h),
          const IconUserDoctorWithDesignation(
            image: "profile6.png",
            name: "Dr. Khairul Hasan",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
          ),
          SizedBox(height: 15.h),
          const IconUserDoctorWithDesignation(
            image: "profile5.png",
            name: "Dr. Faysal Ahmed",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
          ),
          SizedBox(height: 25.h),
          const SectionWithGreenBorder(text: "Follow Consultant"),
          SizedBox(height: 15.h),
          const IconUserDoctorWithDesignation(
            image: "profile7.png",
            name: "Dr. Sifatullah Haque",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
          ),
          SizedBox(height: 15.h),
          const IconUserDoctorWithDesignation(
            image: "profile4.png",
            name: "Dr. Sumaiya Rahman",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
          ),
          SizedBox(height: 15.h),
          const IconUserDoctorWithDesignation(
            image: "blog2.png",
            name: "Dr. Saharaz Hamim",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class DetailsTabBar extends StatelessWidget {
  const DetailsTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionWithGreenBorder(
            text: "Shedule With Doctor(s)",
          ),
          SizedBox(
            height: 15.h,
          ),
          const UserDoctorWithDesignation(
            image: "blog1.png",
            name: "Dr. Ifram Dewan ",
            designation: "Professior",
            education: "MBBS, FCPS, MD",
            DayLeft: "View",
          ),
          SizedBox(
            height: 15.h,
          ),
          const UserDoctorWithDesignation(
            image: "blog3.png",
            name: "Dr. Tasnim Akter ",
            designation: "Psychologist",
            education: "PsyD, FCPS, MD",
            DayLeft: "2D Left",
          ),
          SizedBox(
            height: 25.h,
          ),
          const SectionWithGreenBorder(text: "Recomended Blogs"),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog3.png",
            title: "How to be Happy?",
            description: "Happiness lies deep into our. Here are kind of ...",
          ),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog2.png",
            title: "It's Okay to be sad",
            description: "Being Same make us way more strong. There are ...",
          ),
          SizedBox(height: 15.h),
          DoctorsBlog(
            image: "blog1.png",
            title: "What if you fall in love",
            description:
                "Falling in love is part of life. Being in love is not a ...",
          ),
          SizedBox(height: 15.h)
        ],
      ),
    );
  }
}
