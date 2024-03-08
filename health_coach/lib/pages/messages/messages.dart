import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloris.backgroundColor,
      appBar: AppBar(
        backgroundColor: Coloris.backgroundColor,
        title: const Text("Messages"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const MessagesList(
              images: "logo/icon.png",
              name: "Mental Coach (AI)",
              message: "You: Are you sure?",
            ),
            SizedBox(height: 10.h),
            const MessagesList(
              images: "images/profile5.png",
              name: "Dr. Ifram Dewan",
              message: "Ami jani apni parben",
            ),
            SizedBox(height: 10.h),
            const MessagesList(
              images: "images/profile3.png",
              name: "Khairul Hasan Rakib",
              message: "You: Ji, ami korbo",
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  final String images;
  final String name;
  final String message;
  const MessagesList({
    super.key,
    required this.images,
    required this.name,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 45.h,
          backgroundColor: Coloris.liteGreen,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 42.h,
              backgroundColor: Coloris.backgroundColor,
              backgroundImage: AssetImage("assets/$images"),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Coloris.text)),
            Text(
              message,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500),
            )
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.send_rounded,
          color: Coloris.green,
        )
      ],
    );
  }
}
