import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
// Size transfomation controller
  late TransformationController sizeController1;
  late TransformationController sizeController2;

  VlcPlayerController controller1 = VlcPlayerController.network(
    'cam5',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );

  VlcPlayerController controller2 = VlcPlayerController.network(
    'cam6',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );
  @override
  void onInit() {
    super.onInit();

    controller1.initialize();
    controller2.initialize();
    sizeController1 = TransformationController();
    sizeController2 = TransformationController();
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
  }
}
