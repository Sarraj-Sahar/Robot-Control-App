// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/controllers/websocket_controller.dart';
import '../../../scenarios.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class AddScenarioScreen extends StatefulWidget {
  AddScenarioScreen({Key? key}) : super(key: key);

  @override
  State<AddScenarioScreen> createState() => _AddScenarioScreenState();
}

class _AddScenarioScreenState extends State<AddScenarioScreen> {
  final controller = Get.find<ScenarioController>();

  final websocketContorller = Get.find<WebSocketController>();

  bool? isChecked = false;

  void init() {
    if (mounted) {
      setState(() {
        controller.addedMissionsList =
            controller.storage.read("addedMissionsList");
        controller.sentMissionsList =
            controller.storage.read("sentMissionsList");
        controller.addedStation = controller.storage.read("addedStation");
        controller.sentStation = controller.storage.read("sentStation");
      });
    }
  }

//SEPERATE screen elemnts
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      init();
    });
    Size size = MediaQuery.of(context).size;

    return Material(
      color: Colors.black87,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                child: Text(
                  'New Scenario',
                  style: signFormStyle(28, FontWeight.w500),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                  child: Form(
                    key: controller.scenarioFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Scenario Name :",
                              style: TextStyle(color: Colors.yellow),
                            ),
                            SizedBox(
                              height: 40,
                              width: 200,
                              child: ScenarioTextField(
                                kTextController: controller.InputController,
                                kValidatorFunction: (v) {
                                  return controller.validateScenarioName(v);
                                },
                                kObscureText: false,
                                kLabelText: "Scenario name",
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.1),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  fillColor: MaterialStateProperty.all<Color>(
                                      Colors.green),
                                  activeColor: Colors.green,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isChecked = newValue;
                                    });
                                  }),
                              Text(
                                " Random",
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Iteration:",
                              style: TextStyle(color: Colors.yellow),
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
                                  controller: controller.IterationController,
                                  min: -1,
                                  max: 6,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Missions",
                          style: signFormStyle(20, FontWeight.w300),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: size.height * 0.04,
                              right: size.width * 0.02),
                          height: size.height * 0.5,
                          width: size.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                          ),
                          child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              padding: const EdgeInsets.all(10),
                              itemCount: controller.addedMissionsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text(
                                  "" + controller.addedMissionsList[index],
                                  style: signFormStyle(15, FontWeight.normal),
                                );
                              }),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.missionController.getMissionsList();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.only(
                                        top: 40,
                                        bottom: 40,
                                        right: 200,
                                        left: 200),
                                    child: AddMissiontoScenario(),
                                  );
                                });
                          },
                          child: Text("Add Mission"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    insetPadding: EdgeInsets.only(
                                        top: 40,
                                        bottom: 40,
                                        right: 200,
                                        left: 200),
                                    child: AddStationtoScenario(),
                                  );
                                });
                          },
                          child: Text("Add Station"),
                        ),
                        SizedBox(
                          width: size.width * 0.13,
                          child: ElevatedButton(
                            //TODO : edit mission on edit
                            onPressed: () {
                              print(
                                  "displayed Missions : ${controller.storage.read("addedMissionsList")}");
                              print(
                                  "sent missionsss : ${controller.storage.read("sentMissionsList")}");
                            },
                            child: Text("Edit"),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.13,
                          child: ElevatedButton(
                            onPressed: () {
                              print(
                                  "addedd station : ${controller.storage.read("addedStation")}");
                              print(
                                  "sent station : ${controller.storage.read("sentStation")}");
                            },
                            child: Text("Remove"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //.end
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.InputController.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          websocketContorller.sendToSocket({
                            "handler": "action",
                            "action": "edit_scenario",
                            "data": {
                              "scenario_name": controller.InputController.text,
                              "new_scenario": {
                                "homestation": controller.sentStation,
                                "iteration":
                                    controller.IterationController.text,
                                "missions": controller.sentMissionsList,
                                "random": isChecked
                              }
                            }
                          });
                          Navigator.pop(context);
                          controller.InputController.clear();
                          controller.getScenarioList();
                        },
                        child: Text("Save Scenario")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
