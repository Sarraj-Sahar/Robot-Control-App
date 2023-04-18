import 'dart:developer';
import 'package:get/get.dart';
import 'package:p_guard/app/screens/login/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    log("AuthBinding Called : AuthController ");
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
