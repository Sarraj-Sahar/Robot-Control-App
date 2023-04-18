// ignore_for_file: must_be_immutable, unnecessary_brace_in_string_interps, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import '../../../../screens.dart';

class MissionsList extends GetView<MissionController> {
  static String? addedItem = "itemmm";
  MissionsList({Key? key, addedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.webSocketController.myStreamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (json.decode(snapshot.data.toString())["handler"] == "get" &&
              json.decode(snapshot.data.toString())["data"]["param"] ==
                  "mission_list") {
            controller.missionsList =
                json.decode(snapshot.data.toString())["data"]["value"];
            controller.selectedItem = controller.missionsList.first;

            print("% My missions Listtt : ${controller.missionsList}");
            print("% Selecteddddd itemmmmm : ${controller.selectedItem}");
          }
        } else if (snapshot.hasError) {
          print("STREAM CONTROLLER CONNECT ERRORRRRRRR ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          print("waiting to connect...");
          return Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
              //STYLE :alternative for circular progress indicator
            ),
          );
        }
        //STYLE : dropdownMenu placement
        return DropdownButton<String>(
          focusColor: Colors.grey[800],
          dropdownColor: Colors.grey[800],
          hint: Text(
            "Select Mission",
            style: signFormStyle(15, FontWeight.w200),
          ),
          items: controller.missionsList
              .map(
                (item) => DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    item.length > 30 ? item.substring(0, 30) + '...' : item,
                    overflow: TextOverflow.ellipsis,
                    style: signFormStyle(15, FontWeight.w200),
                  ),
                  value: item,
                ),
              )
              .toList(),
          value: controller.selectedItem,
          onChanged: (item) {
            controller.setSelectedItem(item);
          },
        );
      },
    );
  }
}
