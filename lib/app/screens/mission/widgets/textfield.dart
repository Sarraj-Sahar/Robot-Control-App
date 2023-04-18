// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';

class MissionTextField extends StatelessWidget {
  final String? kLabelText;
  final TextEditingController? kTextController;
  final Function kValidatorFunction;
  final TextInputType? kInputType;
  final bool kObscureText;
  const MissionTextField({
    Key? key,
    this.kLabelText,
    required this.kTextController,
    required this.kValidatorFunction(String V),
    this.kInputType,
    required this.kObscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TextFormField(
      controller: kTextController,
      validator: (v) {
        return kValidatorFunction(v!);
      },
      keyboardType: kInputType,
      obscureText: kObscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.02,
            left: size.height * 0.05),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        hintText: "$kLabelText",
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
