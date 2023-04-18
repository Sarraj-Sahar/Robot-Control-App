// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/size_config.dart';
import '../../main_screen.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({Key? key}) : super(key: key);

  MyDrawerController drawerController = Get.find();
  // AuthController myauthController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //CHANGEME : should be in controller and that's it BUT it's still in portrait mode so for now place it here too...
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    return Scaffold(
      key: drawerController.scaffoldkey,
      drawer: MyNavigationDrawer(),
      body: (SingleChildScrollView(
        child: MainBody(),
      )),
    );
  }
}
