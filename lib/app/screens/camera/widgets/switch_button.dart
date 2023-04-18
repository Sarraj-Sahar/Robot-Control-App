// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';

Widget MySwitchButton(controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Obx(
      () => FlutterSwitch(
        padding: 7.0,
        activeColor: secondaryColor,
        inactiveColor: secondaryColor,
        value: controller.buttonPressed.value,
        onToggle: (value) {
          print("Switch Button VALUE : $value");
          controller.toggle();
        },
      ),
    ),
  );
}

Widget MySwitchButtonText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.grey[600],
    ),
  );
}
