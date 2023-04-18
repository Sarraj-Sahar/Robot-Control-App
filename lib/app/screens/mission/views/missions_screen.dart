// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import 'package:p_guard/app/screens/main_screen/control_panel/controllers/control_panel_controller.dart';
import '../mission.dart';

class MissionScreen extends GetView<MissionController> {
  MissionScreen({Key? key}) : super(key: key);
  WebSocketController webSocketController = Get.find();
  ControlPanelController controlPanelController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.6,
        height: size.height * 0.6,
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(size.height * 0.05),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.1),
              width: size.width * 0.4,
              child: Form(
                key: controller.MissionFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: MissionTextField(
                  kLabelText: "Mission Name ",
                  kObscureText: false,
                  kTextController: controller.InputController,
                  kValidatorFunction: (v) {
                    return controller.validateMissionName(v);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            FittedBox(
              child: Row(
                children: [
                  Obx(
                    () => ElevatedButton(
                      //TODO 1: add selectedMode var in controller and go to create mission screen accordingly : joystick mode or map mode
                      //TODO 2: joystickMode screen shouldn't have map as background ?? ==> no need for an extra new screen with videoStream as background , just change the existing joystickMODE screen to have videoStream as background
                      onPressed: () => controller.toggle(),
                      child: Icon(Icons.map),
                      style:
                          missionButtonStyle(!controller.buttonPressed.value),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Obx(
                    () => ElevatedButton(
                      onPressed: () => controller.toggle(),
                      child: Icon(Icons.sports_esports_outlined),
                      style: missionButtonStyle(controller.buttonPressed.value),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  //TESTI 13:00 : should work fine
                  //TESTI : added emergency stop == waiting condition before going to Start Recording mission
                  // if (controller.robotdetails.data.robotState != "Waiting") {

                  // if (controlPanelController.robotdetails.data.robotState != "Waiting") {
                  if (webSocketController.emergencyStop.value != "Waiting") {
                    Get.snackbar("Need to Disable EmergencyStop First !! ", "",
                        snackPosition: SnackPosition.TOP,
                        colorText: Color.fromARGB(255, 149, 40, 33),
                        backgroundColor: Colors.transparent);
                  } else {
                    controller.StartMission();
                  }
                },
                child: Text("Start"),
                style: missionButtonStyle(
                    webSocketController.emergencyStop.value == "Waiting"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
