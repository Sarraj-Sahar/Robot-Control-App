// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  String? title;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  BottomText({
    Key? key,
    this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$title",
          style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: fontSize),
          textAlign: TextAlign.left),
    );
  }
}
