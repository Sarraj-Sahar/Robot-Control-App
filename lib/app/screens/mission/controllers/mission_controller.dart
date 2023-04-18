// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import 'package:p_guard/app/models/pguard_details_model.dart';
import '../../screens.dart';

//should be removed once seperate AddMissionController is made

class MissionController extends GetxController {
  final WebSocketController webSocketController = Get.find();

  //
  RxBool isloading = false.obs;

  //
  GlobalKey<FormState> MissionFormKey = GlobalKey<FormState>();
  late TextEditingController InputController;
  String missionName = '';

  //
  List<dynamic> missionsList = []; //was static
  final storage = GetStorage();
  late PGuardDetailsModel robotdetails =
      pGuardDetailsModelFromJson(storage.read("tempRobotModel"));
  //
  RxBool buttonPressed = true.obs;
  void toggle() => buttonPressed.value = buttonPressed.value ? false : true;

  //
  //CONTROLLER: should create seperate AddMissionController
  // --> then missionsList would not be here

  String? selectedItem = '';
  void setSelectedItem(item) {
    selectedItem = item;
    MissionsList.addedItem = selectedItem;
  }

  @override
  void onInit() {
    super.onInit();
    InputController = TextEditingController();
    getMissionsList();
  }

  @override
  void dispose() {
    super.dispose();
    InputController.dispose();
  }

  void getMissionsList() {
    log("gettingggggg missions list");
    webSocketController
        .sendToSocket({"handler": "get", "param": "mission_list"});
  }

  String? validateMissionName(String value) {
    if (value.length < 6) {
      return "Invalid Mission Name ";
    } else {
      return null;
    }
  }

  //StartMission : requires form validation
  StartMission() async {
    //Validates every FormField of this form
    //& returns true if there are no errors.
    bool isValidated = MissionFormKey.currentState!.validate();

    if (isValidated) {
      webSocketController.sendToSocket({
        "handler": "action",
        "action": "start_record_mission_mobile",
        "data": {
          "mission_name": InputController.text,
          "closed_path": false,
          "mode": "joy"
        }
      });
      Get.to(const CreateMissionScreen());
    } else {
      Get.defaultDialog(
          middleText: "Invalid mission Name",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
