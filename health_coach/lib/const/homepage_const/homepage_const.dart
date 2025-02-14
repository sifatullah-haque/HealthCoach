import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/situation_test/situation_test.dart';

class RecommendedOptions extends StatelessWidget {
  final String images;
  final String title;
  final String subtitle;
  final String time;
  final Color? color;
  const RecommendedOptions({
    super.key,
    required this.images,
    required this.title,
    required this.subtitle,
    required this.time,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("assets/svg/$images", height: 130.h),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(title,
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w800,
              color: Coloris.liteGrey,
            )),
        Row(
          children: [
            Text(subtitle,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade500,
                )),
            SizedBox(width: 8.w),
            Text(time,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade500,
                ))
          ],
        )
      ],
    );
  }
}

class ContainerBox extends StatelessWidget {
  final String image;
  final String text;
  const ContainerBox({Key? key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Coloris.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: Image.asset(
              "assets/category/$image",
              width: 120.w,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Coloris.text, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class ActiveDoctorList extends StatelessWidget {
  final String image;
  final String name;
  final String previousPrice;
  final String currentPrice;
  const ActiveDoctorList(
      {super.key,
      required this.image,
      required this.name,
      required this.previousPrice,
      required this.currentPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/$image",
            height: 120.h,
          ),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(
                Icons.video_call_rounded,
                color: Coloris.text,
              ),
              Text(
                previousPrice,
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text(
                currentPrice,
                style: TextStyle(
                    color: Coloris.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HeroBanners extends StatelessWidget {
  const HeroBanners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final questionProvider = PHQ9QuestionProvider();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/banner2.png", height: 207.h),
            Image.asset(
              "assets/images/banner3.png",
              width: 145.w,
            )
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SituationTest(
                      questionProvider: questionProvider,
                    ),
                  ),
                );
              },
              child: Image.asset("assets/images/banner4.png", height: 115.h),
            ),
            Image.asset("assets/images/banner5.png", height: 115.h)
          ],
        ),
      ],
    );
  }
}

class HeaderFile extends StatefulWidget {
  const HeaderFile({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderFileState createState() => _HeaderFileState();
}

class _HeaderFileState extends State<HeaderFile> {
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
            radius: 40.h,
            backgroundColor: isAnonymous ? Colors.green : null,
            backgroundImage:
                isAnonymous ? null : AssetImage("assets/common/sifat.jpg"),
          ),
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isAnonymous ? "Anonymous" : "Sifatullah Haque",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Coloris.text,
              ),
            ),
            const Text("Hey! How's it going?"),
          ],
        ),
        const Spacer(), // Add Spacer to push the menu icon to the right
        const Icon(
          Icons.menu,
        )
      ],
    );
  }
}
