import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Coloris.backgroundColor,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Coloris.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/logo.png",
                width: 105.w,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Welcome Back!!!",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    color: Coloris.text),
              ),
              SizedBox(
                height: 25.h,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: Coloris.liteGrey,
                    ),
                    hintText: 'Email Address',
                    hintStyle: const TextStyle(
                        color: Coloris.liteGrey, fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Coloris.green, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Coloris.borderGrey, width: 2.0))),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: Coloris.liteGrey,
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        color: Coloris.liteGrey, fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Coloris.green, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Coloris.borderGrey, width: 2.0))),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Create an account",
                      style: TextStyle(
                          color: Coloris.text,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500)),
                  Text("Forgot Password?",
                      style: TextStyle(
                          color: Coloris.primaryBlue,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              const button(
                text: "Log In",
                size: 300,
              ),
              SizedBox(height: 50.h),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 1.0,
                      color: Coloris.borderGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Or"),
                  ),
                  Expanded(
                    child: Divider(
                      height: 1.0,
                      color: Coloris.borderGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.w,
                    backgroundColor: Coloris.liteGreen,
                    child: Image.asset(
                      "assets/icons/Google.png",
                      width: 40.w,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CircleAvatar(
                    radius: 30.w,
                    backgroundColor: Coloris.liteGreen,
                    child: Image.asset(
                      "assets/icons/Facebook.png",
                      width: 40.w,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CircleAvatar(
                      radius: 30.w,
                      backgroundColor: Coloris.liteGreen,
                      child: Icon(
                        Icons.phone_android_rounded,
                        size: 40.w,
                        color: Coloris.text,
                      )),
                ],
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
