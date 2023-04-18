// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:p_guard/app/constants/constants.dart';

Widget videoController(VlcPlayerController camController, Size size) {
  return GestureDetector(
    onDoubleTap: () {},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: size.height * 0.8,
          width: size.width * 1,
          child: VlcPlayer(
            controller: camController,
            aspectRatio: 3 / 2,
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


  // Widget BuildAnimatedVideo(VlcPlayerController camController) {
  //   final double scale = 1;
  //   final zoomed = Matrix4.identity()..scale(scale);
  //   final value = zoomed;
  //   sizeController1.value = value;
  //   return GestureDetector(
  //     onDoubleTap: () {
  //       camHeight == 155
  //           ? setState(() {
  //               camHeight = 300;
  //               camWidth = MediaQuery.of(context).size.width * 1;
  //             })
  //           : setState(() {
  //               camHeight = 155;
  //               camWidth = MediaQuery.of(context).size.width * 1;
  //             });
  //       // setState(() {
  //       //   camHeight = 300;
  //       //   camWidth = 500;
  //       // });
  //     },
  //     child: InteractiveViewer(
  //       transformationController: sizeController1,
  //       child: Flexible(
  //         child: AnimatedContainer(
  //           height: camHeight,
  //           width: camWidth,
  //           duration: const Duration(seconds: 1),
  //           curve: Curves.easeInOut,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(20),
  //             child: VlcPlayer(
  //               controller: camController,
  //               aspectRatio: 3 / 2, //16/9
  //               placeholder: Center(
  //                 child: CircularProgressIndicator(),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }