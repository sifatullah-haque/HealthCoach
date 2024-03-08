import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/const/homepage_const/homepage_const.dart';

class meditation extends StatelessWidget {
  const meditation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Coloris.backgroundColor,
        appBar: AppBar(
          backgroundColor: Coloris.backgroundColor,
          surfaceTintColor: Coloris.backgroundColor,
          foregroundColor: Coloris.backgroundColor,
          title: Image.asset("assets/logo/text_logo.png", height: 40.h),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Afternoon, Sifat!",
                  style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: Coloris.liteGrey),
                ),
                Text(
                  "We wish you have a good day",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                ),
                SizedBox(height: 20.h),
                MeditationRowImages(
                  title1: "basic.png",
                  title2: "relaxation.png",
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  "assets/meditation/daily_thought.png",
                  width: double.infinity,
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    MeditationRowImages(
                        title1: "reduce_stress.png",
                        title2: "improve_performance.png"),
                    MeditationRowImages(
                        title1: "increase_happiness.png",
                        title2: "reduce_anxiety.png"),
                    MeditationRowImages(
                        title1: "calm_green.png", title2: "better_sleep.png")
                  ],
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  "assets/meditation/daily_calm.png",
                  width: double.infinity,
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    MeditationRowImages(
                        title1: "calm.png", title2: "focus.png"),
                    MeditationRowImages(
                        title1: "anxiety.png", title2: "personal_growth.png"),
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
        ));
  }
}

class MeditationRowImages extends StatelessWidget {
  final String title1;
  final String title2;
  const MeditationRowImages({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Image.asset(
            "assets/meditation/$title1",
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Image.asset(
            "assets/meditation/$title2",
          ),
        ),
      ],
    );
  }
}
