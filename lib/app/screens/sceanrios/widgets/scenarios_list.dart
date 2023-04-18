import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens.dart';

class ScenarioList extends GetView<ScenarioController> {
  const ScenarioList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        // stream: websocketcontroller.MybroadcastStream,
        stream: controller.websocketcontroller.myStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (json.decode(snapshot.data.toString())["handler"] == "get" &&
                json.decode(snapshot.data.toString())["data"]["param"] ==
                    "scenario_list") {
              controller.scenarioList =
                  json.decode(snapshot.data.toString())["data"]["value"];
              controller.storage
                  .write("displayScenariolist", controller.scenarioList);
            }
          } else if (snapshot.hasError) {
            log("STREAM CONTROLLER CONNECT ERRORRRRRRR");
            log("relatedddd errorrr ${snapshot.error}");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            log("waiting to connect...");
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: SpinningWheel(),
              ),
            );
          }

          return ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              // physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: controller.scenarioList.isEmpty
                  ? controller.displayScenarioList.length
                  : controller.scenarioList.length,
              itemBuilder: (BuildContext context, int index) {
                return ScenarioTile(
                    scenarioName: controller.scenarioList.isNotEmpty
                        ? controller.scenarioList[index]
                        : controller.displayScenarioList[index]);
              });
        });
  }
}
