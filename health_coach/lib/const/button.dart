import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/home_page/homepage_test.dart';

class button extends StatelessWidget {
  final String text;
  final double size;
  final Widget destination;
  final String destinationType;

  const button({
    super.key,
    required this.text,
    required this.size,
    required this.destination,
    required this.destinationType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Coloris.green),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)))),
        onPressed: () {
          if (destinationType == "push") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => destination));
          } else if (destinationType == "replace") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => destination));
          } else if (destinationType == "pop") {
            Navigator.pop(context);
          } else if (destinationType == "popUntil") {
            Navigator.popUntil(
                context, ModalRoute.withName(destination.toString()));
          } else if (destinationType == "pushAndRemoveUntil") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => destination),
                ModalRoute.withName(destination.toString()));
          } else if (destinationType == "pushReplacement") {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => destination));
          }
        },
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
