// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import '../login.dart';

class LoginBody extends GetView<LoginController> {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/pguard.png",
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Text("Log In",
              style: signFormStyle(25, FontWeight.w700),
              textAlign: TextAlign.left),
          SizedBox(height: size.height * 0.03),
          Form(
            //getting the formKey from our controller
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                LoginTextField(
                  kLabelText: "email",
                  kIcon: Icons.email,
                  kTextController: controller.emailController,
                  kValidatorFunction: (v) {
                    return controller.validateEmail(v);
                  },
                  kInputType: TextInputType.emailAddress,
                  kObscureText: false,
                ),
                SizedBox(height: size.height * 0.02),
                LoginTextField(
                  kLabelText: "password",
                  kIcon: Icons.lock,
                  kTextController: controller.passwordController,
                  kValidatorFunction: (v) {
                    return controller.validatePasword(v);
                  },
                  kInputType: TextInputType.visiblePassword,
                  kObscureText: true,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),

          //show CircularProgressIndicator after user taps login
          Obx(
            () => Center(
              child: controller.isloading.value == true
                  //STYLE: replace circularProgress with spining wheel
                  ? const CircularProgressIndicator(
                      color: secondaryColor,
                    )
                  : const Text(""),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.05,
              child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    controller.doLogin();
                  },
                  style: loginButtonStyle)),
        ],
      ),
    );
  }
}
