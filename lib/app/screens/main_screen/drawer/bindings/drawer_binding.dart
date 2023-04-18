import 'dart:developer';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    log("DrawerBinding Called : MyDrawerController");
    Get.lazyPut(() => MyDrawerController(), fenix: true);
  }
}
