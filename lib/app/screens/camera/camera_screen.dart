// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_declarations, non_constant_identifier_names, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'camera.dart';

class CameraScreen extends GetView<CameraController> {
  const CameraScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double camWidth = size.width * 0.5;
    double camHeight = size.height * 0.45;
    int zoomValue = 0;

    return Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                        onDoubleTap: () {
                          //TESTI full screen , does it dispose of video when going to full screen ?
                          Get.to(FullVideoScreen(
                            videoController: VlcPlayerController.network(
                              'cam1',
                              hwAcc: HwAcc.full,
                              autoPlay: true,
                              options: VlcPlayerOptions(),
                            ),
                          ));
                          //NEW : this was commented
                          controller.controller3.dispose();
                        },
                        child: BuildAnimatedVideo(
                            controller.controller3, camHeight, camWidth)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 7.0,
                        ),
                        child: CircularCameraSlider(
                            context,
                            controller.buttonPressed.value,
                            controller.webSocketController),
                        // child: SleekCircularSlider(appearance:...)
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      MySwitchButtonText("Back"),
                      MySwitchButton(controller),
                      MySwitchButtonText("Front"),
                    ],
                  ),
                ],
              ),
            ),
            //2NDDDD CAM WITH ZOOM IN ZOOM OUT
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                      onDoubleTap: () {
                        Get.to(FullVideoScreen(
                          videoController: VlcPlayerController.network(
                            'cam2',
                            hwAcc: HwAcc.full,
                            autoPlay: true,
                            options: VlcPlayerOptions(),
                          ),
                        ));
                        // controller3.dispose();
                      },
                      child: BuildAnimatedVideo(
                          controller.controller4, camHeight, camWidth)),
                  buildZoomControlls(size, zoomValue, controller),
                ],
              ),
            ),
          ],
        ));
  }
}
