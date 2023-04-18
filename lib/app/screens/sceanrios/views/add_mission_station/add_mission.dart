// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import '../../scenarios.dart';

class AddMissiontoScenario extends GetView<ScenarioController> {
  AddMissiontoScenario({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: 400,
        width: 450,
        color: Colors.black87,
        child: Column(
          children: [
            Text(
              "Add mission",
              textAlign: TextAlign.center,
              style: signFormStyle(22, FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "Mission Name :",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                        SizedBox(width: 250, child: MissionsList()),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "Pause :",
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: SizedBox(
                            height: 55,
                            width: 200,
                            child: NumberInputWithIncrementDecrement(
                              numberFieldDecoration: InputDecoration(
                                  fillColor: Colors.white, filled: true),
                              initialValue: 0,
                              incIconColor: Colors.white,
                              decIconColor: Colors.white,
                              // incDecBgColor: Colors.green,
                              controller: controller.pauseController,

                              min: -3,
                              max: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, //.end
                        children: [
                          //STYLE: change these buttons style + buttons in add scenario
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                print(
                                    "in add mission added item issss ${MissionsList.addedItem}");

                                controller.addedMissionsList
                                    .add(MissionsList.addedItem);
                                print(
                                    "on saveeee mission this is the addedMissionsList \n ${controller.addedMissionsList}");
                                controller.sentMissionsList.add({
                                  "tour_file": "${MissionsList.addedItem}.json",
                                  "pause": controller.pauseController.text
                                });
                                //CHANGEME :sent missions List formatting
                                // create fct : sentMissionsList.forEach(item){item.add("tour file")...}
                                print(
                                    "555555555 sentt missions object list ${controller.sentMissionsList}");

                                //should also write sentMissionsList ??
                                controller.storage.write(
                                    "addedMissionsList",
                                    controller.addedMissionsList
                                        .map((p) => p.toString())
                                        .toList());

                                //select one mission at a time
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');

                                //Select multiple missions all together
                                // Get.to(AddScenarioScreen());
                              },
                              child: Text("Save Mission")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
