// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

// : Ignore this file, Setting themes is not done yet !!

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:p_guard/constants.dart';
// import 'package:p_guard/themes.dart';

class ThemeButton extends StatefulWidget {
  ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          if (Get.isDarkMode) {
            Get.changeThemeMode(ThemeMode.light);
          } else {
            Get.changeThemeMode(ThemeMode.dark);
          }
        },
        child: Text(
          'click me',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
}
