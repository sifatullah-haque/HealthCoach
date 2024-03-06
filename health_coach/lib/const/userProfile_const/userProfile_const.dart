import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';

class IconUserDoctorWithDesignation extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  final String education;

  const IconUserDoctorWithDesignation({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //profile goes here
        Expanded(
          flex: 3,
          child: CircleAvatar(
            radius: 50.h,
            backgroundColor: Coloris.liteGreen,
            child: CircleAvatar(
              radius: 46.h,
              backgroundImage: AssetImage("assets/images/$image"),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        //name and designation will be added here
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              Text(designation),
              Text(education),
            ],
          ),
        ),
        //messege icon will be added here
        Expanded(flex: 2, child: buttonWithIcon(size: 80))
      ],
    );
  }
}

class UserFileHeader extends StatefulWidget {
  const UserFileHeader({
    Key? key,
  }) : super(key: key);

  @override
  _UserFileHeaderState createState() => _UserFileHeaderState();
}

class _UserFileHeaderState extends State<UserFileHeader> {
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isAnonymous = !isAnonymous;
            });
          },
          child: CircleAvatar(
            radius: 50.h,
            backgroundColor: isAnonymous ? Colors.green : null,
            backgroundImage: isAnonymous
                ? null
                : const AssetImage("assets/common/sifat.jpg"),
          ),
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isAnonymous ? "Anonymous" : "Sarker Sifatullah Haque",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Coloris.text,
              ),
            ),
            const Text("Hey! How's it going?"),
          ],
        ),
      ],
    );
  }
}

class UserDoctorWithDesignation extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  final String education;
  final String DayLeft;
  const UserDoctorWithDesignation({
    super.key,
    required this.image,
    required this.name,
    required this.designation,
    required this.education,
    required this.DayLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //profile goes here
        Expanded(
          flex: 3,
          child: CircleAvatar(
            radius: 50.h,
            backgroundColor: Coloris.liteGreen,
            child: CircleAvatar(
              radius: 46.h,
              backgroundImage: AssetImage("assets/images/$image"),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        //name and designation will be added here
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              Text(designation),
              Text(education),
            ],
          ),
        ),
        //messege icon will be added here
        Expanded(
          flex: 2,
          child: buttonSecond(text: DayLeft, size: 90),
        )
      ],
    );
  }
}

class SectionWithGreenBorder extends StatelessWidget {
  final String text;
  const SectionWithGreenBorder({
    super.key,
    required this.text,
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
        padding: EdgeInsets.all(8.0),
        child: Text(text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Coloris.text,
            )),
      ),
    );
  }
}
