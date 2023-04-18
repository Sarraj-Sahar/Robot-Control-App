import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import 'package:rxdart/rxdart.dart';
import '../../../mission/controllers/controllers.dart';

class ControlPanelController extends GetxController {
  WebSocketController webSocketController = Get.find();
  MissionController missionController = Get.find();

  final GetStorage storage = GetStorage();
  late String token = storage.read('token');

  StreamController myStreamController = BehaviorSubject();

  //Get latLong from shared prefrences
  LatLng? getLatlongFromSharedPrefs() {
    return LatLng(
      (storage.read("Latitude")),
      (storage.read("Longitude")),
    );
  }

  void sendInit() {
    webSocketController.sendToSocket({"handler": "init"});
  }

  @override
  void onInit() {
    super.onInit();
    sendInit();
    storage.write("Latitude", 0.0);
    storage.write("Longitude", 0.0);
  }
}
