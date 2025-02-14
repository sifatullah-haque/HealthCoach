import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/home_page/homepage_test.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloris.backgroundColor,
      appBar: AppBar(
        backgroundColor: Coloris.backgroundColor,
        title: Text("Community",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: Coloris.text)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Coloris.green,
                          width: 1.5.w,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("ask for help!",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    flex: 2,
                    child: button(
                      text: "Post",
                      size: 100,
                      destinationType: "pushReplacement",
                      destination: HomePageTest(),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              communityPost(),
              SizedBox(height: 15.h),
              communityPost(),
            ],
          ),
        ),
      ),
    );
  }
}

class communityPost extends StatelessWidget {
  const communityPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Coloris.green,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.h,
                  backgroundColor: Coloris.green,
                  child: CircleAvatar(
                    radius: 38.h,
                    backgroundImage: AssetImage("assets/images/profile3.png"),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nur Hamim Saharaz",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Coloris.text)),
                    Text("2 Hours ago",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500)),
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              "ছোটো বেলা থেকেই খুব restrictions এর মাঝে বড় হয়েছি. ছেলে হওয়া স্বত্তেও এতো সব বাঁধা পেড়োতে হয়েছে! তবে এতে যেমন একদিক দিয়ে সুফল হয়েছে যে বাজে কোনো সঙ্গ গড়ে উঠেনি, বিগড়ে যাইনি, আবার একদিক দিয়ে সমস্যা হয়েছে, কখনো কোনো বন্ধুও হয়নি আমার.",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Coloris.text),
            ),
          ],
        ),
      ),
    );
  }
}
