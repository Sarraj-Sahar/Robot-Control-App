// ignore_for_file: unnecessary_overrides, unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:p_guard/app/models/pguard_details_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:rxdart/rxdart.dart';

class WebSocketController extends GetxController {
  static GetStorage storage = GetStorage();

  static String token = storage.read('token');

  StreamController myStreamController = BehaviorSubject();

  //TODO : add vars here
  //batterylevel.obs; emergency_button.obs
  PGuardDetailsModel? robotdetails;

  var emergencyStop = "".obs;

  //TODO : then add update fcts and reading data fct here
  //update vars here
  //and then access them with controller.var_name

  //"ws://192.168.3.79:7023/pguard/"

  late IOWebSocketChannel channel =
      IOWebSocketChannel.connect("ws://41.228.129.117:7023/pguard/", headers: {
    "Authorization": "Bearer $token",
    'Connection': 'upgrade',
    'Upgrade': 'websocket'
  });

  void sendToSocket(Object object) {
    channel.sink.add(
      jsonEncode(
        object,
      ),
    );
  }

  //
  void connect() {
    channel = IOWebSocketChannel.connect("ws://41.228.129.117:7023/pguard/",
        headers: {
          "Authorization": "Bearer $token",
          'Connection': 'upgrade',
          'Upgrade': 'websocket'
        });
    log("connected to Socket!");

    myStreamController.addStream(channel.stream);

    myStreamController.stream.listen((data) {
      debugPrint("2.Stream Data: " + data);

      // saving init data in robotDetails var to get emergencyStop value
      if (json.decode(data)["handler"] == "init") {
        robotdetails = pGuardDetailsModelFromJson(data.toString());

        emergencyStop(robotdetails!.data.robotState);

        //handle emergency_stop changes (send_data)
        //TESTI : is emergencyStop being updated instantly : fazet e test before start mission

        if (json.decode(data)["handler"] == "send_data" &&
                json.decode(data)["data"]["param"] == "robot_state" ||
            json.decode(data)["data"]["param"] == "clicked_button") {
          emergencyStop(json.decode(data)["data"]["value"].toString());
          //TESTI!! TAKEOFF 13:00
          log("Directlyyyyyy var from websocket Afterrr SAVED ROBOT STATE IN robotDetails should NOT BE EmergencyStop: ${emergencyStop}");
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  @override
  void dispose() {
    super.dispose();
    // myStreamController.close();
    // channel.sink.close();
  }
}
