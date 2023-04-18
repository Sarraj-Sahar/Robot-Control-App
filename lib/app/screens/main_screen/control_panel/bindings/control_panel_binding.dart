import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class ControlPanelBinding extends Bindings {
  @override
  void dependencies() {
    log("ControlPanelBinding Called : ControlPanelController");
    Get.lazyPut(() => ControlPanelController(), fenix: true);
  }
}
