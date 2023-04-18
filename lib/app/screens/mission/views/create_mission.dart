// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import '../mission.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class CreateMissionScreen extends StatefulWidget {
  //CONTROLLER: createMissionController
  const CreateMissionScreen({Key? key}) : super(key: key);

  @override
  State<CreateMissionScreen> createState() => _CreateMissionScreenState();
}

class _CreateMissionScreenState extends State<CreateMissionScreen> {
  static const step = 10.0;
  double _x = 100;
  double _y = 100;
  WebSocketController controller = Get.find<WebSocketController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/earth.png"),
                fit: BoxFit.cover),
          ),
        ),
        // /* STYLE: make joystick draggable
        // Draggable(
        //   childWhenDragging: Container(),
        //   // Positioned(bottom: 0.0, left: 10, child: MycustomJoystick()),
        //   feedback: MycustomJoystick(),
        //   child:*/
        // Positioned(
        //   bottom: 0.0,
        //   left: 10,
        //   child: MycustomJoystick(), // Joystick(...)
        // ),
        // // )
        Positioned(bottom: 0.0, left: 10, child: MycustomJoystick()),
        // Positioned(
        //   bottom: 5.0,
        //   right: 10,
        //   child:
        // Column(children: [
        //GET POS
        Positioned(
          top: 200.0,
          right: 75,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: size * 0.1,
                primary: Colors.amber[700],
                shape: CircleBorder(),
              ),
              onPressed: () {
                controller.sendToSocket({
                  "handler": "action",
                  "action": "xbox",
                  "data": {
                    //"axes": [1.0, 2.0, 0.0, 0.0, 0.0, 0.0],
                    "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
                    "buttons": [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
                  }
                });
                // Return to 0,0,0 after done

                controller.sendToSocket({
                  "handler": "action",
                  "action": "xbox",
                  "data": {
                    "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
                    "buttons": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  }
                });
              },
              child: Text("Y")),
        ),

        //§§§ 1st button = speed +1
        Positioned(
          top: 250.0,
          right: 140,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: size * 0.1,
                primary: Colors.blue[900],
                shape: CircleBorder(),
              ),
              onPressed: () {
                controller.sendToSocket({
                  "handler": "action",
                  "action": "xbox",
                  "data": {
                    "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
                    "buttons": [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  }
                });
                controller.sendToSocket({
                  "handler": "action",
                  "action": "xbox",
                  "data": {
                    "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
                    "buttons": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  }
                });
              },
              child: Text("X")),
        ),

        //CONFIRM
        //§§§ 2nd button = 1 ==> confirm : set only 2nd button to 1
        Positioned(
          bottom: 30.0,
          right: 75,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: size * 0.1,
                primary: Colors.green,
                shape: CircleBorder(),
              ),
              onPressed: () {
                controller.sendToSocket({
                  "handler": "action",
                  "action": "xbox",
                  "data": {
                    "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
                    "buttons": [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  }
                });
                controller.sendToSocket({
                  "handler": "action",
                  "action": "xbox",
                  "data": {
                    "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
                    "buttons": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                  }
                });
              },
              child: Text("A")),
        ),

        //SAVE
        //§§§ save button : save_record_mission
        Positioned(
          top: 250.0,
          right: 10,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: size * 0.1,
                primary: Colors.red,
                shape: CircleBorder(),
              ),
              onPressed: () {
                controller.sendToSocket({
                  "handler": "action",
                  "action": "save_record_mission",
                  "data": ""
                });
              },
              child: Text("B")),
        ),

        // ]), // Joystick(...)
        // ),
      ]),
    );
  }

  Widget MycustomJoystick() {
    return Joystick(
        // stickOffsetCalculator:,
        onStickDragEnd: () {
          controller.sendToSocket({
            "handler": "action",
            "action": "xbox",
            "data": {
              "axes": [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              "buttons": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            }
          });
        },
        listener: (details) {
          //CONTROLLER :need to place this fct in controller
          setState(() {
            _x = _x + step * details.x;
            _y = _y + step * details.y;
            // print("X : $_x , Y : $_y");
            //To do: place in init
            //§§§§§§§§§§§§§§§§§§§§§§§§§
            //NO longer Needed ??
            // controller.sendToSocket({
            //   "handler": "action",
            //   "action": "clicked_button",
            //   "data": {"value": "AxisTeleop"}
            // });
            //§§§§§§§§§§§§§§§§§§§§§§§§§

            // controller.sendToSocket({
            //   "handler": "action",
            //   "action": "joystick", //xbox
            //   "data": {
            //     "axes": [-details.x, -details.y, 0.0], //0,0,0
            //     "buttons": [0, 0, 0, 0, 0, 0] //1,1,1,
            //   }

            controller.sendToSocket({
              "handler": "action",
              "action": "xbox",
              "data": {
                "axes": [-details.x, -details.y, 0.0, 0.0, 0.0, 0.0],
                "buttons": [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
                //move according to joystick position
              }
              // // 5th button = lb
              //to stop robot = all buttons = 0
              //to get robot position ; 4th button = 1 when button pressed (rest = 0)
              //on release == all buttons are set to 0 !!!! so 4th button   takes 0 again on release
              //to set speed == button 1st button =1 (each tap = + 1 )
              //to confirm 2nd button == 1
              //// save_record_mission = another whole button
            });
          });
        },
        mode: JoystickMode.all,
        stick: SphereBall(),
        base: MyBase());
  }
}
