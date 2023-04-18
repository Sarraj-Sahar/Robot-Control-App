// To parse this JSON data, do
//
//     final pGuardDetailsModel = pGuardDetailsModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'dart:convert';

PGuardDetailsModel pGuardDetailsModelFromJson(String str) =>
    PGuardDetailsModel.fromJson(json.decode(str));

String pGuardDetailsModelToJson(PGuardDetailsModel data) =>
    json.encode(data.toJson());

//1. The global class englobing :
//"handler" : "init" ,
//"description" : "success"
//"code" : "200"
// "data" : "[array of robot details]" with (detail) "position_gps" : "[array contains "lat":"0" & "lon" : "0"

class PGuardDetailsModel {
  PGuardDetailsModel({
    required this.handler,
    required this.description,
    required this.code,
    required this.data,
  });

  String handler;
  String description;
  int code;
  Data data;

  factory PGuardDetailsModel.fromJson(Map<String, dynamic> json) =>
      PGuardDetailsModel(
        handler: json["handler"],
        description: json["description"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "handler": handler,
        "description": description,
        "code": code,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.audioFile,
    this.audioList,
    required this.automaticDome,
    required this.avoiding,
    required this.batteryLevel,
    required this.detecting,
    required this.chargingTime,
    this.clickedButton,
    this.cmdVel,
    this.currentMission,
    this.connectionStation,
    this.distanceStation,
    this.docked,
    this.dockingFailed,
    this.dockingStep,
    required this.domeOrientation,
    required this.emergencyStopPgms,
    this.emergencyStopPguard,
    this.guidanceStatus,
    this.isCharging,
    required this.isMoving,
    required this.lights,
    required this.micro,
    required this.missionList,
    this.navigationState,
    required this.opticalZoom,
    this.polygons,
    required this.positionGps,
    required this.relayRobot,
    this.robotState,
    this.robotStatus,
    required this.scenarioList,
    this.safetyActive,
    this.shortCircuit,
    required this.speaker,
    this.speed,
    required this.stationName,
    required this.switchCam,
    this.rtkCorrection,
  });

  dynamic audioFile;
  dynamic audioList;
  bool? automaticDome;
  bool? avoiding;
  num? batteryLevel;
  bool? detecting;
  //int chargingTime;
  String? chargingTime;
  dynamic clickedButton;
  dynamic cmdVel;
  dynamic currentMission;
  dynamic connectionStation;
  dynamic distanceStation;
  dynamic docked;
  dynamic dockingFailed;
  dynamic dockingStep;
  int? domeOrientation;
  bool? emergencyStopPgms;
  dynamic emergencyStopPguard;
  dynamic guidanceStatus;
  dynamic isCharging;
  bool? isMoving;
  bool? lights;
  bool? micro;
  List<dynamic>? missionList;
  dynamic navigationState;
  int? opticalZoom;
  dynamic polygons;
  PositionGps? positionGps;
  bool? relayRobot;
  //dynamic
  String? robotState;
  dynamic robotStatus;
  List<dynamic>? scenarioList;
  dynamic safetyActive;
  dynamic shortCircuit;
  bool? speaker;
  dynamic speed;
  String? stationName;
  bool? switchCam;
  dynamic rtkCorrection;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        audioFile: json["audio_file"],
        audioList: json["audio_list"],
        automaticDome: json["automatic_dome"],
        avoiding: json["avoiding"],
        batteryLevel: json["battery_level"],
        detecting: json["detecting"],
        chargingTime: json["charging_time"],
        clickedButton: json["clicked_button"],
        cmdVel: json["cmd_vel"],
        currentMission: json["current_mission"],
        connectionStation: json["connection_station"],
        distanceStation: json["distance_station"],
        docked: json["docked"],
        dockingFailed: json["docking_failed"],
        dockingStep: json["docking_step"],
        domeOrientation: json["dome_orientation"],
        emergencyStopPgms: json["emergency_stop_pgms"],
        emergencyStopPguard: json["emergency_stop_pguard"],
        guidanceStatus: json["guidance_status"],
        isCharging: json["is_charging"],
        isMoving: json["is_moving"],
        lights: json["lights"],
        micro: json["micro"],
        missionList: json["mission_list"] == null
            ? null
            : List<dynamic>.from(json["mission_list"].map((x) => x)),
        navigationState: json["navigation_state"],
        opticalZoom: json["optical_zoom"],
        polygons: json["polygons"],
        positionGps: json["position_gps"] == null
            ? PositionGps(lat: 0.0, lon: 0.0)
            : PositionGps.fromJson(json["position_gps"]),
        relayRobot: json["relay_robot"],
        robotState: json["robot_state"],
        robotStatus: json["robot_status"],
        scenarioList: json["scenario_list"] == null
            ? null
            : List<dynamic>.from(json["scenario_list"].map((x) => x)),
        safetyActive: json["safety_active"],
        shortCircuit: json["short_circuit"],
        speaker: json["speaker"],
        speed: json["speed"],
        stationName: json["station_name"],
        switchCam: json["switch_cam"],
        rtkCorrection: json["rtk_correction"],
      );

  Map<String, dynamic> toJson() => {
        "audio_file": audioFile,
        "audio_list": audioList,
        "automatic_dome": automaticDome,
        "avoiding": avoiding,
        "battery_level": batteryLevel,
        "detecting": detecting,
        "charging_time": chargingTime,
        "clicked_button": clickedButton,
        "cmd_vel": cmdVel,
        "current_mission": currentMission,
        "connection_station": connectionStation,
        "distance_station": distanceStation,
        "docked": docked,
        "docking_failed": dockingFailed,
        "docking_step": dockingStep,
        "dome_orientation": domeOrientation,
        "emergency_stop_pgms": emergencyStopPgms,
        "emergency_stop_pguard": emergencyStopPguard,
        "guidance_status": guidanceStatus,
        "is_charging": isCharging,
        "is_moving": isMoving,
        "lights": lights,
        "micro": micro,
        "mission_list": List<dynamic>.from(missionList!.map((x) => x)),
        "navigation_state": navigationState,
        "optical_zoom": opticalZoom,
        "polygons": polygons,
        "position_gps": positionGps?.toJson(),
        "relay_robot": relayRobot,
        "robot_state": robotState,
        "robot_status": robotStatus,
        "scenario_list": List<dynamic>.from(scenarioList!.map((x) => x)),
        "safety_active": safetyActive,
        "short_circuit": shortCircuit,
        "speaker": speaker,
        "speed": speed,
        "station_name": stationName,
        "switch_cam": switchCam,
        "rtk_correction": rtkCorrection,
      };
}

//
class PositionGps {
  PositionGps({
    required this.lat,
    required this.lon,
  });

  double? lat;
  double? lon;

  factory PositionGps.fromJson(Map<String, dynamic> json) => PositionGps(
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
