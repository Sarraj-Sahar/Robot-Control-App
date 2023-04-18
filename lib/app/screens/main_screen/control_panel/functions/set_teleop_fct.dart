// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/models/pguard_details_model.dart';
import './../control_panel.dart';

VoidCallback? teleopFunction(
    ControlPanelController controller, PGuardDetailsModel robotdetails) {
  //TODO: remove this condition, not needed , since setting teleop will change robot_state to Teleop which is obviously != waiting
  if (robotdetails.data.robotState != "Waiting") {
    // shouldn't work if "Recording" either
    Get.snackbar(
      "Set EmergencyStop to Waiting First !",
      "",
      colorText: const Color.fromARGB(255, 171, 50, 42),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
    );
  } else {
    if (robotdetails.data.clickedButton != "XboxTeleop" &&
        robotdetails.data.robotState != "RemoteTeleop") {
      print("ClickedButton = ${robotdetails.data.clickedButton} ");
      controller.webSocketController.sendToSocket({
        "handler": "action",
        "action": "clicked_button",
        "data": {"value": "XboxTeleop"}
      });

      Get.snackbar(
        "XboxTeleop Enabled",
        "",
        colorText: Colors.green,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
      );
    } else {
      print("XboxTeleop already disabled");
      controller.webSocketController.sendToSocket({
        "handler": "action",
        "action": "clicked_button",
        "data": {"value": "Pause"}
      });

      Get.snackbar(
        "XboxTeleop Disabled",
        "",
        colorText: const Color.fromARGB(255, 142, 95, 25),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.transparent,
      );
    }
  }
  return null;
}

Color setTeleopColor(clickedButton) {
  if (clickedButton == "XboxTeleop") {
    return Colors.green;
  } else {
    return Colors.grey;
  }
}
