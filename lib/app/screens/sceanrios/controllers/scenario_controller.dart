// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../../../models/pguard_details_model.dart';
import '../../screens.dart';

class ScenarioController extends GetxController {
  final websocketcontroller = Get.find<WebSocketController>();
  final missionController = Get.find<MissionController>();

  //
  List<dynamic> scenarioList = [];
  late List<dynamic> displayScenarioList =
      storage.read("displayScenariolist"); //Only shown if there is no data

  late List<dynamic> scenarioMissionsList =
      storage.read("sceanrioMissionsList");

  late List<dynamic>? missionsPointsList = storage.read("missionsPointsList");

  //
  final storage = GetStorage();
  late List<dynamic> addedMissionsList = storage.read("addedMissionsList");
  late List<dynamic> sentMissionsList = storage.read("sentMissionsList");

  //
  late String addedStation = storage.read("addedStation");
  late String sentStation = storage.read("sentStation");

  //
  RxBool isloading = false.obs;

  //
  GlobalKey<FormState> scenarioFormKey = GlobalKey<FormState>();
  late TextEditingController InputController;
  late TextEditingController IterationController =
      TextEditingController(text: "-1");
  late TextEditingController pauseController;
  String scenarioName = '';
  PGuardDetailsModel? robotdetails;

  @override
  void onInit() {
    super.onInit();
    robotdetails = pGuardDetailsModelFromJson(storage.read("tempRobotModel"));
    getScenarioList();
    InputController = TextEditingController();
    pauseController = TextEditingController();
  }

  void addscenario() {
    Get.to(AddScenarioScreen());
    storage.write("addedMissionsList", <dynamic>[]);
    storage.write("sentMissionsList", <dynamic>[]);
    storage.write("addedStation", "");
    storage.write("sentStation", "");
  }

  List<Marker> buildHomeMarker() {
    final _homeMarker = <Marker>[];
    final mapItem = missionsPointsList!.isNotEmpty
        ? missionsPointsList![0]
        : missionsPointsList![0] = '';

    _homeMarker.add(Marker(
        point: latLng.LatLng(mapItem["latitude"], mapItem["longitude"]),

        // point: latLng.LatLng(missionsPointsList![0]["latitude"],
        //     missionsPointsList![0]["longitude"]),
        builder: (_) {
          return const Icon(
            Icons.location_on,
            size: 25,
            color: Colors.pink,
          );
        }));

    return _homeMarker;
  }

  List<Marker> builRobotMarker(_animationController) {
    final _robotMarker = <Marker>[];
    _robotMarker.add(
      Marker(
        width: 60.0,
        height: 60.0,
        point: latLng.LatLng(
            robotdetails!.data.positionGps!.lat!.obs.toDouble(),
            robotdetails!.data.positionGps!.lon!.obs.toDouble()),
        builder: (ctx) => RobotLocationMarker(_animationController),
      ),
    );
    return _robotMarker;
  }

  List<Marker> buildMarkers() {
    final _markerList = <Marker>[];

    //TESTI what's causing the error
    // ignore: unused_local_variable
    final homeItem = missionsPointsList![0]; //is it just this ? if nottt ==>

    // ===> place this after list itearation
    //and start iterating from i=1....
    //// _markerList.add(Marker(
    //     point: latLng.LatLng(homeItem["latitude"], homeItem["longitude"]),
    //     builder: (_) {
    //       return const Icon(
    //         Icons.location_on,
    //         size: 18,
    //         color: primaryColor,
    //       );
    //     }));
    for (int i = 0; i < missionsPointsList!.length; i++) {
      final mapItem = missionsPointsList![i];

      //TESTI ORR place and if operator here as such
      // if (i == 0) {
      //   _markerList.add(Marker(
      //       point: latLng.LatLng(mapItem["latitude"], mapItem["longitude"]),
      //       builder: (_) {
      //         return const Icon(
      //           Icons.location_on,
      //           size: 23,
      //           color: Colors.pink,
      //         );
      //       }));
      // } else {

      _markerList.add(Marker(
          point: latLng.LatLng(mapItem["latitude"], mapItem["longitude"]),
          builder: (_) {
            return const Icon(
              Icons.location_on,
              size: 18,
              color: primaryColor,
            );
          }));
      // }
    }
    return _markerList;
  }

  List<latLng.LatLng> buildPolyline() {
    final _polylineList = <latLng.LatLng>[];
    for (int i = 0; i < missionsPointsList!.length; i++) {
      final mapItem = missionsPointsList![i];
      _polylineList
          .add(latLng.LatLng(mapItem["latitude"], mapItem["longitude"]));
    }
    return _polylineList;
  }

  String? validatePauseTime(int value) {
    if (value.isNegative) {
      return "Change Pause time";
    } else {
      return null;
    }
  }

  String? validateIteration(int value) {
    if (value > 0) {
      return "Invalid Iteration number";
    } else {
      return null;
    }
  }

  void getScenario(String sceanrioName) {
    websocketcontroller.sendToSocket({
      "handler": "action",
      "action": "get_scenario",
      "data": {"scenario_name": sceanrioName}
    });
  }

  void getMission(String missionName) {
    websocketcontroller.sendToSocket({
      "handler": "action",
      "action": "get_mission",
      "data": {"mission_name": missionName}
    });
  }

  //
  void getScenarioList() {
    log("###### gettinggggg scenarios listtt : ");
    websocketcontroller
        .sendToSocket({"handler": "get", "param": "scenario_list"});
  }

  String? validateScenarioName(String value) {
    if (value.length < 6) {
      return "Invalid Scenario Name ";
    } else {
      return null;
    }
  }

  SaveScenario() async {
    //Validates every FormField of this form
    //& returns true if there are no errors.
    bool isValidated = scenarioFormKey.currentState!.validate();

    if (isValidated) {
      // mycontroller.sendToSocket({
      //   "handler": "action",
      //   "action": "start_record_mission_mobile",
      //   "data": {
      //     "mission_name": InputController.text,
      //     "closed_path": false,
      //     "mode": "joy"
      //   }
      // });
      // Navigator.pop();
    } else {
      //STYLE default dialog
      Get.defaultDialog(
          middleText: "Invalid Scenario Name",
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  @override
  void onClose() {
    super.onClose();
    InputController.dispose();
  }
}
