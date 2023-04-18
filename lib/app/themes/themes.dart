// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';

class Themes {
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryColor,
    primaryColor: secondaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      disabledColor: Colors.grey,
    ),
  );

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: secondaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      disabledColor: Colors.grey,
    ),
  );
}
