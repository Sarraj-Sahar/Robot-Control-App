import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
