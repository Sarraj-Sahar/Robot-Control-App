import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/screens/sceanrios/controllers/controllers.dart';

class ScenarioTile extends GetView<ScenarioController> {
  final String? scenarioName;
  const ScenarioTile({Key? key, required this.scenarioName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //SIZE : listTile height : sizeConfig , it works !
      height: 50,
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.only(left: 7),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        //TODO 5: if listTile selected change color to "tappedColor" to show which listTile is selected at the moment
        //color: Colors.grey[200],
      ),
      child: Row(children: [
        //STYLE : style listTiles

        Row(
          children: const [
            Align(
              alignment: Alignment.center,
              // Center(
              child: Icon(
                Icons.delete,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit_outlined,
              color: primaryColor,
              size: 10,
            )
          ],
        ),
        // ),
        Flexible(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              scenarioName!,
              style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  //TESTI : set points list to null each time...besh scenarios ye5dhoush points 8altin
                  controller.missionsPointsList!.clear();
                  log("resetting points to zero on tap : ${controller.storage.read("missionsPointsList")}");
                  controller.getScenario(scenarioName!);
                  log("location marker tapped");
                },
                child: const Icon(
                  Icons.location_pin,
                  size: 30,
                  color: Colors.green,
                )),
            const SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  log("launch sceanrio tapped");
                },
                child: const Icon(
                  Icons.play_circle_filled,
                  size: 30,
                  color: secondaryColor,
                )),
          ],
        ),
      ]),
    );
    //
    // return Material(
    //   child: ListTile(
    //     shape: RoundedRectangleBorder(
    //         side: BorderSide(color: Colors.black, width: 1),
    //         borderRadius: BorderRadius.circular(5)),
    //     leading: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
    //     title: Text("${scenarioName}"),
    //     trailing:
    //          Row(
    //           children: [
    //         IconButton(
    //             //TESTI : is this the right way to pass the fct
    //             onPressed: (() => controller.getScenario(scenarioName!)),
    //             icon: Icon(Icons.place)),
    //         IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow_rounded)),
    //       ],
    //     ),
    //   ),
    // );
  }
}
