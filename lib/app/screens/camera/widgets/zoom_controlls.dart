import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';
import '../camera.dart';

Widget buildZoomControlls(
    Size size, int zoomValue, CameraController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0),
    child: SizedBox(
      width: size.width * 0.20,
      height: size.height * 0.33,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.12,
            width: size.width * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor,
            ),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (zoomValue < 100) {
                    zoomValue += 10;
                    log("!!! my Zoom value  : $zoomValue");
                    controller.webSocketController.sendToSocket({
                      "handler": "action",
                      "action": "optical_zoom",
                      "data": {"value": zoomValue}
                    });
                  } else {
                    log("!!! Zoom value is at max 100 !! : $zoomValue");
                    controller.webSocketController.sendToSocket({
                      "handler": "action",
                      "action": "optical_zoom",
                      "data": {"value": zoomValue}
                    });
                  }
                },
                icon: Icon(
                  Icons.zoom_in,
                  size: size.height * 0.08,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.12,
            width: size.width * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor,
            ),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (zoomValue > 0) {
                    zoomValue -= 10;
                    log("!!! my Zoom value  : $zoomValue");
                    controller.webSocketController.sendToSocket({
                      "handler": "action",
                      "action": "optical_zoom",
                      "data": {"value": zoomValue}
                    });
                  } else {
                    log("!!! Zoom value is at min 0 !! : $zoomValue");
                    controller.webSocketController.sendToSocket({
                      "handler": "action",
                      "action": "optical_zoom",
                      "data": {"value": zoomValue}
                    });
                  }
                },
                icon: Icon(
                  Icons.zoom_out,
                  size: size.height * 0.08,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    ),
  );
}
