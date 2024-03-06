import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';

class TestResult extends StatelessWidget {
  const TestResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //-------------------------------------------------
        //               Logo & App Bar
        //-------------------------------------------------
        title: Image.asset(
          "assets/logo/text_logo.png",
          width: 200.w,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Coloris.backgroundColor,
        foregroundColor: Coloris.backgroundColor,
        surfaceTintColor: Coloris.backgroundColor,
      ),
      backgroundColor: Coloris.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-------------------------------------------------
              //              Score & Suggestion Part
              //-------------------------------------------------
              Text(
                "Your Score:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.h),
              const BoxWithText(
                text: "55.7",
                size: 60,
                fsize: 22,
              ),
              SizedBox(height: 15.h),
              Text(
                "You're Now: ",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.h),
              const BoxWithText(
                text: "Depressed",
                size: 60,
                fsize: 22,
              ),
              SizedBox(height: 15.h),
              Text(
                "Suggestions:",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.h),
              const BoxWithText(
                text:
                    "Seek support from loved ones or professionals, prioritize self-care, and hold onto hope for better days ahead.",
                size: 150,
                fsize: 19.5,
              ),
              SizedBox(
                height: 25.h,
              ),
              //-------------------------------------------------
              //            Suggested Doctor Part
              //-------------------------------------------------
              Text(
                "Suggested Doctor",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15.h),
              const DoctorWithDesignation(
                image: "profile1",
                name: "Dr. Jahanara Porsha",
                designation: "PhD, PsyD, DFMT",
              ),
              SizedBox(height: 15.h),
              const DoctorWithDesignation(
                  image: "profile2",
                  name: "Dr. Sabrina Khandakar",
                  designation: "PsyD, MBBS"),
              SizedBox(height: 15.h),
              const DoctorWithDesignation(
                image: "profile3",
                name: "Dr. Mahfuzur Rahman",
                designation: "PsyD, DFMT",
              ),

              //-------------------------------------------------
              //              Suggested Blog Part
              //-------------------------------------------------

              SizedBox(height: 25.h),
              Text(
                "Suggested Blog",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15.h,
              ),
              DoctorsBlog(
                image: "blog1.png",
                title: "What if you fall in love",
                description:
                    "Falling in love is part of life. Being in love is not a ...",
                color: Coloris.green,
              ),
              SizedBox(height: 20.h),
              DoctorsBlog(
                image: "blog2.png",
                title: "It's Okay to be sad",
                description:
                    "Being Same make us way more strong. There are ...",
              ),
              SizedBox(height: 20.h),
              DoctorsBlog(
                image: "blog3.png",
                title: "How to be Happy?",
                description: "Happiness lies into our mind. Here are ...",
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorsBlog extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Color? color;
  DoctorsBlog({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //image goes here
        Image.asset(
          "assets/images/$image",
          height: 110.h,
        ),
        //text and other part goes here
        SizedBox(width: 25.w),
        SizedBox(
          width: 220.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Coloris.text),
              ),
              SizedBox(height: 5.h),
              Text(
                description,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Coloris.text,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Read More",
                style: TextStyle(color: Coloris.green),
              )
            ],
          ),
        )
      ],
    );
  }
}

class DoctorWithDesignation extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  const DoctorWithDesignation({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //profile goes here
        CircleAvatar(
          radius: 45.h,
          backgroundColor: Coloris.liteGreen,
          child: CircleAvatar(
            radius: 42.h,
            backgroundImage: AssetImage("assets/images/$image.png"),
          ),
        ),

        //name and designation will be added here
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(designation)
          ],
        ),
        //messege icon will be added here
        Icon(
          Icons.messenger_outline_rounded,
          size: 45.h,
          color: Coloris.liteGrey,
        )
      ],
    );
  }
}

class BoxWithText extends StatelessWidget {
  final String text;
  final double size;
  final double fsize;
  const BoxWithText({
    super.key,
    required this.text,
    required this.size,
    required this.fsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.h,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Coloris.liteGreen,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fsize.sp,
                fontWeight: FontWeight.w400,
                color: Coloris.text),
          ),
        ),
      ),
    );
  }
}
