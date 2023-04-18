import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    log("HomeBinding Called : HomeController ");
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
