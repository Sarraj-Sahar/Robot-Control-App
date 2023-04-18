// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable, sized_box_for_whitespace, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import '../../main_screen.dart';

class MainBody extends GetView<MyDrawerController> {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      // fix errors : A renderFlex overflowed by
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Ink(
                height: size.height * 0.1,
                decoration: ShapeDecoration(
                  color: secondaryColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  onPressed: () => controller.openDrawer(),
                  color: signFormColor,
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
              ),
              ControlPanel(),
            ],
          ),
          Obx(() => Container(
                height: 339,
                width: size.width,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
                  child: controller.getWidget(),
                ),
              ))
        ],
      ),
    );
  }
}
