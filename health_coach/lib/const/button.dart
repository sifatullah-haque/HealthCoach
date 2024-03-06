import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';

class button extends StatelessWidget {
  final String text;
  final double size;

  const button({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Coloris.green),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Coloris.whiteGreen),
        ),
      ),
    );
  }
}

class buttonSecond extends StatelessWidget {
  final String text;
  final double size;

  const buttonSecond({
    Key? key, // Corrected the key parameter
    required this.text,
    required this.size,
  }) : super(key: key); // Corrected super call

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.w,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Coloris.green,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Coloris.green,
                )),
          ),
        ));
  }
}

class buttonWithIcon extends StatelessWidget {
  final double size;

  const buttonWithIcon({
    Key? key, // Corrected the key parameter

    required this.size,
  }) : super(key: key); // Corrected super call

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.w,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Coloris.green,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
              child: Icon(
                Icons.add_circle_rounded,
                color: Coloris.green,
              )),
        ));
  }
}
