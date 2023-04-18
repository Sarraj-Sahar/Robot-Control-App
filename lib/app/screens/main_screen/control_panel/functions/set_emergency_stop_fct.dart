import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:p_guard/app/screens/mission/controllers/controllers.dart';
import '../../../../models/pguard_details_model.dart';
import './../control_panel.dart';

VoidCallback? emergencyStopFunction(ControlPanelController controller,
    PGuardDetailsModel robotdetails, MissionController missionController) {
  if (robotdetails.data.robotState == "EmergencyStop") {
    // log("1..BEFOREE current SAVED ROBOT STATE IN robotDeatils should BE EmergencyStop: ${missionController.robotdetails.data.robotState}");
    controller.webSocketController.sendToSocket({
      "handler": "action",
      "action": "clicked_button",
      "data": {"value": "Waiting"}
    });
    //

    // log("2.Afterrr SAVED ROBOT STATE IN robotDetails should NOT BE EmergencyStop: ${robotdetails.data.robotState}");

    robotdetails =
        pGuardDetailsModelFromJson(controller.storage.read("tempRobotModel"));
    log("2.from robot details Afterrr SAVED ROBOT STATE IN robotDeatils should NOT BE EmergencyStop: ${robotdetails.data.robotState}}");
    //NEW
    //TESTING emergency value from var in websocket should be working fine !
    log("2. var from websocket Afterrr SAVED ROBOT STATE IN robotDetails should NOT BE EmergencyStop: ${controller.webSocketController.emergencyStop}");
  } else {
    // log("3.BEFOREE current SAVED ROBOT STATE IN robotDeatils should be NOT EmergencyStop: ${missionController.robotdetails.data.robotState}");
    log("^^^^^^^^^^^^^^^ robot is waiting or paused or recording ==> sending action :'EmergencyStop' ");

    controller.webSocketController.sendToSocket({
      "handler": "action",
      "action": "clicked_button",
      "data": {"value": "EmergencyStop"}
    });
    // TODO:not necessary , test and remove
    // controller.webSocketController
    //     .sendToSocket({"handler": "get", "param": "robot_state"});
    // robotdetails =
    //     pGuardDetailsModelFromJson(controller.storage.read("tempRobotModel"));

    log("4. from robot deatils AFTERRRRR SAVED ROBOT STATE IN robotDeatils should BE EmergencyStop: ${robotdetails.data.robotState}");
    log("4.from var websocket AFTERRRRR SAVED ROBOT STATE IN robotDeatils should BE EmergencyStop: ${controller.webSocketController.emergencyStop}}");

    // Get.snackbar("emergency stop OFF",);
  }
  return null;
}

Color setEmergencyStopColor(robotState) {
  if (robotState == "EmergencyStop") {
    return Colors.red; //Color.fromARGB(255, 192, 59, 59)
  } else {
    return Colors.grey;
  }
}
// Color setEmergencyStopColor(robotState) {
//   if (robotState == "EmergencyStop") {
//     return Colors.red; //Color.fromARGB(255, 192, 59, 59)
//   } else if (robotState == "Waiting") {
//     return Colors.green;
//   } else if (robotState == "Pause") {
//     return Colors.amber; //Color.fromARGB(255, 107, 107, 107)
//   } else {
//     return Colors.blue;
//   }
// }

///////old fct : get robot state by sending get "robot_state"
/////TESTI THISSS : try getting the value from snapshot like this again
///VoidCallback? EmergencyStopFunction(
//     ControlPanelController controller, AsyncSnapshot<Object?> snapshot) {
//   controller.webSocketController
//       .sendToSocket({"handler": "get", "param": "robot_state"});

//   var data = json.decode(snapshot.data.toString());

//   if (data["handler"] == "get" &&
//       data["description"] == "Success" &&
//       data["data"]["param"] == "robot_state" &&
//       data["data"]["value"] == "Waiting") {
//     print(
//         "robot doesn't have emergency stop, CAN MOVE ,emergency button NOT tapped");
//     controller.webSocketController.sendToSocket({
//       "handler": "action",
//       "action": "clicked_button",
//       "data": {"value": "EmergencyStop"}
//     });
//
//     controller.webSocketController
//         .sendToSocket({"handler": "get", "param": "robot_state"});
//     print(
//         "Emergency Button has been tapped \n checkinnng value \n ${data["data"]["value"]}");
//     // Get.snackbar(
//     //   "robot WAITING",
//     //   "",
//     //   snackPosition: SnackPosition.TOP,
//     //   backgroundColor: Colors.green,
//     // );

//     //////////////////////////////////////////
//   } else if (data["handler"] == "get" &&
//       data["description"] == "Success" &&
//       data["data"]["param"] == "robot_state" &&
//       data["data"]["value"] == "EmergencyStop") {
//     print(
//         "robot HAS emergency stop , CAN NOT MOVE ,emergency button IS tapped");

//     controller.webSocketController.sendToSocket({
//       "handler": "action",
//       "action": "clicked_button",
//       "data": {"value": "Waiting"}
//     });
//
//     controller.webSocketController
//         .sendToSocket({"handler": "get", "param": "robot_state"});
//     print(
//         "Off Emergency button \n checkinnng value \n ${data["data"]["value"]}");
//     // Get.snackbar("emergency stop OFF",);
//   }
// }
