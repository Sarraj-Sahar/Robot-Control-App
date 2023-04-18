import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';

// Widget Mybutton() {

class LightButton extends GetView<WebSocketController> {
  const LightButton({Key? key}) : super(key: key);

//TODO : setLights
  @override
  Widget build(BuildContext context) {
    //TAKEOFF : see google's video on streams at 4:13 : stream.where()
    //     return StreamBuilder(
    //     stream: controller.myStreamController.stream,
    //            stream: controller.webSocketController.streamSubscription,

    //     builder: (context, snapshot) {
    //       PGuardDetailsModel robotdetails;
    //       if (snapshot.hasData) {
    //         var data = json.decode(snapshot.data.toString());
    //         String stringData = (snapshot.data.toString());
    //         print('2.data : ' + stringData);

    return FloatingActionButton(
      child: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        // openCloseDial: isDialOpen,
        backgroundColor: secondaryColor,
        overlayColor: Colors.transparent,
        overlayOpacity: 0.1,
        spacing: 5,
        spaceBetweenChildren: 7,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.lightbulb_outline, color: Colors.white),
              backgroundColor: secondaryColor,
              onTap: () {
                log('lights Tapped');
                //TODO : test if robotdetails.lights == false
                //sendToSocket
              }),
          // SpeedDialChild(
          //     child:
          //         Icon(Icons.volume_up_outlined, color: Colors.white),
          //     backgroundColor: secondaryColor,
          //     onTap: () {}),
          // SpeedDialChild(
          //     child: Icon(
          //       Icons.mic_none,
          //       color: Colors.white,
          //     ),
          //     backgroundColor: secondaryColor,
          //     onTap: () {}),
        ],
      ),
      onPressed: () {},
    );
    //   }
    //   return Container();
    // });
  }
}
