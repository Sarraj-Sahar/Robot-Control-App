import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    log("LoginBinding Called : LoginController + AuthController ");
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
