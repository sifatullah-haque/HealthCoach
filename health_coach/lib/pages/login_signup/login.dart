import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/button.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/home_page/homepage.dart';
import 'package:health_coach/pages/home_page/homepage_test.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please enter both email and password';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      // Remove the setSettings call as it's causing issues
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      if (userCredential.user != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePageTest()),
          (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      setState(() {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is badly formatted.';
            break;
          case 'user-disabled':
            errorMessage = 'This user account has been disabled.';
            break;
          default:
            errorMessage = 'Authentication failed. Please try again.';
            print(
                'Firebase Auth Error: ${e.code} - ${e.message}'); // For debugging
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'An unexpected error occurred';
        print('Login Error: $e'); // For debugging
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Add this line
      appBar: AppBar(
        backgroundColor: Coloris.backgroundColor,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Coloris.backgroundColor,
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: Coloris.liteGrey,
                        ),
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(
                            color: Coloris.liteGrey,
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Coloris.green, width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Coloris.liteGreen, width: 2.0))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          color: Coloris.liteGrey,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Coloris.liteGrey,
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Coloris.green, width: 2.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Coloris.liteGreen, width: 2.0))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  if (errorMessage.isNotEmpty)
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
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
                  GestureDetector(
                    onTap: isLoading ? null : login,
                    child: Container(
                      height: 45.h,
                      width: 250.w,
                      decoration: BoxDecoration(
                          color: Coloris.green,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Coloris.whiteGreen,
                              )
                            : Text(
                                "Log In",
                                style: TextStyle(
                                    color: Coloris.whiteGreen,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
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
                          width: 25.w,
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
                          width: 25.w,
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
                            size: 30.w,
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
        ),
      ),
    );
  }
}
