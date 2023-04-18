// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

const primaryColor = Color(0xff121212);
const secondaryColor = Color(0xff009289);
const signFormColor = Colors.white;

TextStyle signFormStyle(double myfontsize, FontWeight myFontWeight) {
  return TextStyle(
    fontSize: myfontsize,
    color: Colors.white,
    height: 1.5,
    fontWeight: myFontWeight, //FontWeight.w700
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
  );
}

//LoginButton style

final loginButtonStyle = ElevatedButton.styleFrom(
  shape: StadiumBorder(),
  primary: secondaryColor,
  textStyle: TextStyle(
      color: signFormColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
      fontStyle: FontStyle.normal,
      fontSize: 15.0),
);

//For Control Panel buttons in Home Screen
final optionButtonStyle = ElevatedButton.styleFrom(
  //STYLE : remove splash effect from battery button , rtk, connceted
  // splashFactory: NoSplash.splashFactory,
  primary: Colors.white,
  onPrimary: primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    side: const BorderSide(color: secondaryColor),
  ),
);

// Add mission buttons style
ButtonStyle? missionButtonStyle(bool pressedValue) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: pressedValue ? secondaryColor : Colors.grey,
      ),
    ),
    primary: pressedValue ? secondaryColor : Colors.grey,
    textStyle: TextStyle(
        color: signFormColor,
        fontWeight: FontWeight.bold, //w600
        // fontFamily: "Poppins",
        fontStyle: FontStyle.normal,
        fontSize: 18.0), //15
  );
}
