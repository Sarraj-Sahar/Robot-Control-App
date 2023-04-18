// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'dart:ui';

import 'package:flutter/material.dart';

class RobotLocationMarker extends AnimatedWidget {
  const RobotLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    const markerColor = Color.fromARGB(255, 70, 224, 158);
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(0.5, 1.0, value)!;
    final size = 50.0;
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: size * newValue,
              width: size * newValue,
              decoration: BoxDecoration(
                color: markerColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: markerColor, //Color.fromARGB(156, 7, 248, 164),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
