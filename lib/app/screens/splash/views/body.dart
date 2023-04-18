import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/routes/routes.dart';
import 'package:p_guard/app/screens/login/controllers/controllers.dart';
import '../widgets/bottom_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _BodyState();
}

class _BodyState extends State<SplashBody> {
  AuthController authController = Get.find();
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      if (authController.isAuth() == true) {
        Get.offAllNamed(Routes.mainScreen);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: primaryColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              "assets/images/pguard.png",
              alignment: Alignment.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BottomText(
                title: "from",
                color: signFormColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
              BottomText(
                title: "EnovaRobotics",
                color: secondaryColor,
                fontSize: 23.0,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: size.height * 0.063),
            ],
          ),
        ],
      ),
    );
  }
}
