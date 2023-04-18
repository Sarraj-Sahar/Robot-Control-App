// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Widget CircularCameraSlider(BuildContext context, bool buttonPressed,
    WebSocketController webSocketController) {
  return SleekCircularSlider(
    appearance: CircularSliderAppearance(
      size: MediaQuery.of(context).size.width * 0.17,
      customColors: CustomSliderColors(
        trackColor: Colors.grey.shade300,
        progressBarColor: Colors.amber,
        dotColor: Color.fromARGB(255, 108, 201, 255),
        shadowColor: Colors.grey.shade600,
      ),
      customWidths: CustomSliderWidths(
        trackWidth: 5,
        progressBarWidth: 5,
        handlerSize: 10,
      ),
    ),
    min: 0,
    max: 180,
    initialValue: 0,
    onChangeEnd: (domevalue) {
      if (buttonPressed == true) {
        print("OOO DOME ORIENTATION VALUE  : $domevalue");
        webSocketController.sendToSocket({
          "handler": "action",
          "action": "dome_orientation",
          "data": {"value": domevalue.toInt()}
        });
      } else {
        print("OOO DOME ORIENTATION VALUE  : ${-domevalue}");
        webSocketController.sendToSocket({
          "handler": "action",
          "action": "dome_orientation",
          "data": {"value": -domevalue.toInt()}
        });
      }
    },
    innerWidget: (double value) {
      return Center(
        child: Text(
          '${value.round()}°',
          style: TextStyle(
              color: Colors.grey, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      );
    },
  );
}
