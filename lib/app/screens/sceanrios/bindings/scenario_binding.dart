import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class ScenarioBinding extends Bindings {
  @override
  void dependencies() {
    log("ScenarioBinding Called : ScenarioController ");
    Get.lazyPut(() => ScenarioController(), fenix: true);
  }
}
