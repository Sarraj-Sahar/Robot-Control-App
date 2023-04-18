// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import '../../scenarios.dart';

class AddStationtoScenario extends GetView<ScenarioController> {
  AddStationtoScenario({Key? key}) : super(key: key);

  // String? selectedItem = MissionsList.addedItem;

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
              "Add Station",
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
                            "Station Name :",
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
                              enabled: false,
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
                          //STYLE change these buttons style + buttons in add scenario
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
                                    "in add station added item issss ${MissionsList.addedItem}");

                                // addedMissionsList.add(MissionsList.addedItem);
                                controller.addedStation =
                                    '${MissionsList.addedItem} (Station)';

                                test(String value) =>
                                    value.contains("(Station)");
                                var toRemove = [];

                                for (var element
                                    in controller.addedMissionsList) {
                                  if (test(element) == true) {
                                    toRemove.add(element);
                                  }
                                }
                                controller.addedMissionsList
                                    .removeWhere((e) => toRemove.contains(e));
                                controller.addedMissionsList
                                    .add(controller.addedStation);

                                //
                                print(
                                    "111 on saveeee picked stationnn : ${controller.addedStation}");

                                //
                                controller.sentStation =
                                    MissionsList.addedItem!;

                                //
                                print(
                                    "222 on saveeee sentt stationnn : ${controller.sentStation}");

                                controller.storage.write(
                                    "addedStation", controller.addedStation);
                                controller.storage.write(
                                    "sentStation", controller.sentStation);

                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');
                                // Get.to(AddScenarioScreen());
                              },
                              child: Text("Save Station")),
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
