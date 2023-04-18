// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_declarations, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/screens/home/views/home_map.dart';
import 'home.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: const [
        // HomeVideosColumn(controller.controller1, size, controller.controller2),//HOME
        HomeMap(),
        // TesterMap(),
      ],
    );
  }
}
