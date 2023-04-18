// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:p_guard/app/constants/constants.dart';

Widget BuildVideo(VlcPlayerController camController, Size size) {
  return GestureDetector(
    onDoubleTap: () {},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: size.height * 0.9,
          width: size.width * 0.97,
          child: VlcPlayer(
            controller: camController,
            aspectRatio: 3 / 2,
            placeholder: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget BuildAnimatedVideo(
    VlcPlayerController camController, double camHeight, double camWidth) {
  //TOCHECK : uncomment this and see if these value affect the zooming in with fingers
  // const double scale = 1;
  // final zoomed = Matrix4.identity()..scale(scale);
  // final value = zoomed;

  // sizeController1.value = value;
  return InteractiveViewer(
    // transformationController: sizeController1,
    child: FittedBox(
      fit: BoxFit.cover,
      child: AnimatedContainer(
        height: camHeight,
        width: camWidth,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: VlcPlayer(
            controller: camController,
            aspectRatio: 16 / 9,
            placeholder: Center(
              child: CircularProgressIndicator(
                color: secondaryColor,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
