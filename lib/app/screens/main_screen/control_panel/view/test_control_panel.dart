// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/models/pguard_details_model.dart';
import 'package:p_guard/app/screens/main_screen/control_panel/widgets/control_panel_placeholder.dart';
import '../control_panel.dart';

class ControlPanel extends GetView<ControlPanelController> {
  ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO :will no longer need stream builder , can access vars from controller
    //leave this as is for now
    return StreamBuilder(
      stream: controller.webSocketController.myStreamController.stream,
      builder: (context, snapshot) {
        PGuardDetailsModel robotdetails;
        robotdetails = pGuardDetailsModelFromJson(
            controller.storage.read("tempRobotModel"));
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          String stringData = (snapshot.data.toString());

          // print('1.data : ' + stringData);

          if (data["handler"] == "init") {
            print("sendInit Robot Details: $stringData");
            robotdetails = pGuardDetailsModelFromJson(stringData);

            controller.storage.write("tempRobotModel", stringData);
          }

          //SEPERATE
          //Updating battery level
          if ((data["handler"] == "send_data") &&
              (data["data"]["param"] == "battery_level")) {
            print("Updatingggg battery :");

            robotdetails = pGuardDetailsModelFromJson(
                controller.storage.read("tempRobotModel"));

            num newBattery = num.parse("${data["data"]["value"]}");

            robotdetails.data.batteryLevel = newBattery;
            String stringRobotDetails = pGuardDetailsModelToJson(robotdetails);

            controller.storage.write("tempRobotModel", stringRobotDetails);

            print("222222 : updating battery to $newBattery ");
          }

          //Updating LatLong coordinates : see in home map

          //Updating Emergency_Button
          if ((data["handler"] == "get" || data["handler"] == "send_data") &&
              (data["code"] == 200) &&
              (data["data"]["param"] == "robot_state" ||
                  data["data"]["param"] == "clicked_button" ||
                  data["data"]["param"] == "navigation_state")) {
            String newRobotstate = "${data["data"]["value"]}";
            //TESTI : This IS getting the correct value, comment this out and see if it still does
            //otherWise , add read.fromStorage() anywhere where It is NOT being read correctly
            // robotdetails = pGuardDetailsModelFromJson(
            //     controller.storage.read("tempRobotModel"));
            print("oldddRobotState : ${robotdetails.data.robotState}");

            print("newRobotstateeeeee from stream: $newRobotstate");

            robotdetails.data.robotState = newRobotstate;
            String stringRobotDetails = pGuardDetailsModelToJson(robotdetails);

            controller.storage.write("tempRobotModel", stringRobotDetails);
            robotdetails = pGuardDetailsModelFromJson(
                controller.storage.read("tempRobotModel"));
            print(
                "new robotState from robotDetailsModel: ${robotdetails.data.robotState}");
          }

          //Updating Teleop button
          if ((data["handler"] == "get" || data["handler"] == "send_data") &&
              (data["code"] == 200) &&
              (data["data"]["param"] == "robot_state" ||
                  data["data"]["param"] == "clicked_button"))
          //      &&
          // data["data"]["value"] == //TAKEOFF
          //     "XboxTeleop") // this condition should NOT exist , should update for every value
          //TOCHECK :
          {
            String newTeleop = "${data["data"]["value"]}";
            print("newTTTTeleop : $newTeleop");

            robotdetails = pGuardDetailsModelFromJson(
                controller.storage.read("tempRobotModel"));

            //TOCHECK : should newTeleop value be assigned to data.clickedButton
            robotdetails.data.clickedButton = newTeleop;
            String stringRobotDetails = pGuardDetailsModelToJson(robotdetails);

            controller.storage.write("tempRobotModel", stringRobotDetails);
          }

          //Updating RTK_Button
          //TESTI : rtk value updating
          if ((data["handler"] == "get" || data["handler"] == "send_data") &&
              (data["code"] == 200) &&
              (data["data"]["param"] == "rtk_correction")) {
            bool newRTK = data["data"]["value"];
            print("newRTKkkk value : $newRTK");
            robotdetails = pGuardDetailsModelFromJson(
                controller.storage.read("tempRobotModel"));

            robotdetails.data.rtkCorrection = newRTK;
            String stringRobotDetails = pGuardDetailsModelToJson(robotdetails);

            controller.storage.write("tempRobotModel", stringRobotDetails);
          }
          //
          //final : Getting most uptodate robotModel
          robotdetails = pGuardDetailsModelFromJson(
              controller.storage.read("tempRobotModel"));
          return Obx(
            () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: OptionButton(
                        kOnTap: () {},
                        title: "${robotdetails.data.batteryLevel.obs}%",
                        icon: setBatteryIcon(robotdetails.data.batteryLevel),
                        iconSize: 30.0,
                        iconColor:
                            setBatteryColor(robotdetails.data.batteryLevel)),
                  ),
                  // ),
                  OptionButton(
                      kOnTap: (() => teleopFunction(controller, robotdetails)),
                      title: "Teleop",
                      icon: Icons.sports_esports_outlined,
                      iconSize: 30,
                      iconColor:
                          setTeleopColor(robotdetails.data.clickedButton)),

                  //
                  OptionButton(
                    kOnTap: () {},
                    title: "Connected",
                    icon: Icons.circle,
                    iconSize: 18,
                    iconColor: ('${robotdetails.data.connectionStation}' ==
                            'null') //TOCHECK : which value to test connection ?
                        //--> test if websocket connected or not
                        ? Color.fromARGB(255, 107, 107, 107)
                        : Colors.green[400],
                  ),
                  //
                  OptionButton(
                    kOnTap: () {},
                    title: "RTK",
                    icon: Icons.gps_fixed,
                    iconSize: 25,
                    iconColor: (robotdetails.data.rtkCorrection == false)
                        ? Color.fromARGB(255, 107, 107, 107)
                        : Colors.green[400],
                  ),

                  //
                  OptionButton(
                      kOnTap: (() => emergencyStopFunction(controller,
                          robotdetails, controller.missionController)),
                      title: "Emergency",
                      icon: Icons.stop_circle_outlined,
                      iconSize: 22,
                      iconColor: setEmergencyStopColor(
                          robotdetails.data.robotState.obs)),
                ]),
          );
        } else if (snapshot.hasError) {
          log("websockettttt errorrrr :  ${snapshot.error}");
        }
        return controlPanelPlaceholder();
      },
    );
  }
}
