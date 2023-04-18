// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/screens/screens.dart';
import 'package:get_storage/get_storage.dart';

class MyDrawerController extends GetxController {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final ScenarioController scenarioController = Get.find();
  RxInt tappedPage = 0.obs;
  final storage = GetStorage();

  navigateToPage(int index) {
    if (index == 0) {
      return HomeScreen();
    } else if (index == 1) {
      return ScenarioScreen();
    } else if (index == 2) {
      return (CameraScreen());
    } else if (index == 3) {
      return (MissionScreen());
    } else if (index == 4) {
      return (SettingsScreen());
    }
  }

  Widget getWidget() {
    var index = tappedPage.toInt();
    if (index == 0) {
      return navigateToPage(0);
    } else if (index == 1) {
      return navigateToPage(1);
    } else if (index == 2) {
      return navigateToPage(2);
    } else if (index == 3) {
      return navigateToPage(3);
    } else if (index == 4) {
      return navigateToPage(4);
    }
    return Text("invalid");
  }

  void openDrawer() {
    scaffoldkey.currentState?.openDrawer();
  }
}
