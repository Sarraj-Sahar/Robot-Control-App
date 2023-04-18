import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class MissionBinding extends Bindings {
  @override
  void dependencies() {
    log("MissionBinding Called : MissionController ");
    Get.lazyPut(() => MissionController(), fenix: true);
  }
}
