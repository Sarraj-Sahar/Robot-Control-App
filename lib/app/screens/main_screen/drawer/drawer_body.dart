// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/screens/login/controllers/controllers.dart';
import 'drawer.dart';

class MyNavigationDrawer extends GetView<MyDrawerController> {
  MyNavigationDrawer({Key? key}) : super(key: key);

  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            buildDrawerHeader(
                username: authController.getName()!,
                useremail: authController.getEmail()!),
            const Divider(
              color: Colors.grey,
            ),
            buildDrawerItem(
              icon: Icons.home,
              text: "Home",
              onTap: () {
                controller.tappedPage.value = 0;
                controller.navigateToPage(0);
              },
              // tileColor: Get.currentRoute == Routes.Home ? Colors.blue : null,
              tileColor: Colors.white,
              textIconColor: Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.menu,
              text: "Scenario",
              onTap: () {
                controller.scenarioController.getScenarioList();
                controller.scenarioController.missionsPointsList!.clear();
                controller.tappedPage.value = 1;
                controller.navigateToPage(1);
              },
              tileColor: Colors.white,
              textIconColor: Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.camera,
              text: "Camera",
              onTap: () {
                controller.tappedPage.value = 2;
                controller.navigateToPage(2);
              },
              tileColor: Colors.white,
              textIconColor: Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.navigation_outlined,
              text: "Mission",
              onTap: () {
                controller.tappedPage.value = 3;
                controller.navigateToPage(3);
              },
              tileColor: Colors.white,
              textIconColor: Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.settings,
              text: "Settings",
              onTap: () {
                controller.tappedPage.value = 4;
                controller.navigateToPage(4);
              },
              tileColor: Colors.white,
              textIconColor: Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.logout,
              text: "Logout",
              onTap: () {
                authController.logOut();
              },
              tileColor: Colors.white,
              textIconColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
