// ignore_for_file: library_prefixes
import 'dart:convert';
import 'dart:developer';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:p_guard/app/constants/constants.dart';
import '../../../models/pguard_details_model.dart';
import '../scenarios.dart';
import '../widgets/scenario_screen_placeholder.dart';

class ScenarioScreen extends StatefulWidget {
  const ScenarioScreen({Key? key}) : super(key: key);
  @override
  State<ScenarioScreen> createState() => _ScenarioScreenState();
}

class _ScenarioScreenState extends State<ScenarioScreen>
    with SingleTickerProviderStateMixin {
  ScenarioController controller = Get.find();
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //TESTI if still shows list and remove
    // controller.getScenarioList();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: controller.websocketcontroller.myStreamController.stream,
        builder: (context, snapshot) {
          PGuardDetailsModel robotdetails;
          robotdetails = pGuardDetailsModelFromJson(
              controller.storage.read("tempRobotModel"));
          var data = json.decode(snapshot.data.toString());
          if (snapshot.hasData) {
            //if Scenario Tapped , get scenario's missionsList and save it , then send getMission for each mission
            // in sceanrio's missionsList and save each missions's points in missionsPoints List
            if ((data["handler"] == "action") &&
                (data["data"]["action"] == "get_scenario")) {
              controller.scenarioMissionsList =
                  data["data"]["value"]["missions"];
              log("initial list: ${controller.scenarioMissionsList}");

              //reformatting && saving

              controller.scenarioMissionsList = controller.scenarioMissionsList
                  .map(
                    (e) => e["tour_file"].substring(
                      0,
                      e["tour_file"].indexOf('.'),
                    ),
                  )
                  .toList();
              //TESTI after commenting this , if still works fine delete
              controller.scenarioMissionsList = controller.scenarioMissionsList;

              controller.storage.write(
                  "sceanrioMissionsList", controller.scenarioMissionsList);
              log("saveddddd scenario missions list ${controller.scenarioMissionsList} ");

              //Getting points for each mission
              //TODO :turn into this
              //TESTI for in instead of forEach() --> if works delete forEach
              // for (int i = 0; i < controller.scenarioMissionsList.length; i++) {
              // log("getting point for each mission"); //delete this too
              // controller.getMission(controller.scenarioMissionsList[i]);
              // }

              // ignore: avoid_function_literals_in_foreach_calls
              controller.scenarioMissionsList.forEach((element) {
                log("getting point for each mission");
                controller.getMission(element);
              });
            }
            if ((data["handler"] == "action") &&
                (data["data"]["action"] == "get_mission")) {
              List<dynamic> points = data["data"]["value"]["points"];

              // controller.missionsPointsList = controller.storage.read(
              //         "missionsPointsList") + // so points from each mission add up
              //     (points.map((e) => e["location"]).toList());

              for (var i = 0; i < points.length; i++) {
                controller.missionsPointsList!.add(points[i]["location"]);
              }

              log("missions Points for each mission ${controller.missionsPointsList}");

              controller.storage
                  .write("missionsPointsList", controller.missionsPointsList);
            }
            return Row(
              children: [
                SizedBox(
                  width: size.width * 0.45,
                  child: Column(
                    children: const [
                      Center(
                        child: Text(
                          "Scenarios List ",
                          style: TextStyle(
                            fontSize: 25,
                            color: secondaryColor,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ScenarioList(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, right: 8.0, left: 0.0, bottom: 8.0),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FlutterMap(
                          // mapController: _mapctl,
                          options: MapOptions(
                            maxZoom: 18,
                            zoom: 18,
                            rotation: -17.6,
                            center: latLng.LatLng(
                                robotdetails.data.positionGps!.lat!.obs
                                    .toDouble(),
                                robotdetails.data.positionGps!.lon!.obs
                                    .toDouble()),
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate:
                                  "https://api.mapbox.com/styles/v1/enovarobotics/cl2ys0ea9001m14m2nw1e7zuw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                              additionalOptions: {
                                'accessToken':
                                    "pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                                'id': 'mapbox.mapbox-streets-v8'
                              },
                            ),
                            PolylineLayerOptions(
                              polylines: [
                                Polyline(
                                    points: controller.buildPolyline(),
                                    strokeWidth: 4.0,
                                    color: Colors.blue),
                              ],
                            ),
                            MarkerLayerOptions(
                              markers: controller.buildMarkers(),
                            ),
                            // MarkerLayerOptions(
                            //   markers: controller.buildHomeMarker(),
                            // ),
                            MarkerLayerOptions(
                              markers: controller
                                  .builRobotMarker(_animationController),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0.0,
                        child: ElevatedButton(
                          child: const Text("+  Add Scenario"),
                          style: loginButtonStyle,
                          onPressed: controller.addscenario,
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            );
          }
          return const MapPlaceHolder(); // Text("NO DATA")
        });
  }
}
