// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: primaryColor,
        // body: SingleChildScrollView(child: Body()), // for landscape Mode
        body: LoginBody(),
      ),
    );
  }
}
