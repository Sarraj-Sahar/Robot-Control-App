// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import '../onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

//TODO : Change to One time onboarding screen (shared prefrences ,getStoarge...)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: OnBoardingBody(),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward,
            color: secondaryColor,
          ),
          backgroundColor: signFormColor,
          onPressed: () => Get.toNamed("/signIn")),
    );
  }
}
