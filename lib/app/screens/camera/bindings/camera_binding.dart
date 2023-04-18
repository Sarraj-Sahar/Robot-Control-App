import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    log("CameraBinding Called : CameraController ");
    Get.lazyPut(() => CameraController(), fenix: true);
  }
}
