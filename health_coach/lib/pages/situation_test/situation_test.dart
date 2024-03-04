import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';

class SituationTest extends StatelessWidget {
  const SituationTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Coloris.backgroundColor,
      ),
      backgroundColor: Coloris.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Image.asset(
                "assets/logo/text_logo.png",
                width: 200.w,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "Question: 01/42",
            ),
            SizedBox(height: 25.h),
            Container(
              width: double.infinity,
              height: 175.h,
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
                    "I have difficulty understanding abstract ideas.",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: Coloris.text),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            const CheckOption(text: "Disagree"),
            SizedBox(height: 15.h),
            const CheckOption(text: "Slightly Disagree"),
            SizedBox(height: 15.h),
            const CheckOption(text: "Neutral"),
            SizedBox(height: 15.h),
            const CheckOption(text: "Slightly Agree"),
            SizedBox(height: 15.h),
            const CheckOption(text: "Agree"),
            SizedBox(height: 50.h),
            const Center(child: button(text: "Next", size: 160))
          ],
        ),
      ),
    );
  }
}

class CheckOption extends StatefulWidget {
  final String text;
  const CheckOption({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CheckOptionState createState() => _CheckOptionState();
}

class _CheckOptionState extends State<CheckOption> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: double.infinity,
        height: 55.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: isChecked ? Colors.green : Coloris.liteGreen,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: isChecked ? Colors.green : Coloris.liteGreen,
                  ),
                  color: isChecked ? Colors.green : Colors.transparent,
                ),
                child: isChecked
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20.sp,
                      )
                    : null,
              ),
              SizedBox(width: 15.w),
              Text(
                widget.text,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Coloris.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
