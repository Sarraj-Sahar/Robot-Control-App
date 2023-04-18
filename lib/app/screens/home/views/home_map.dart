// ignore_for_file: library_prefixes, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../../../constants/constants.dart';
import '../../../models/pguard_details_model.dart';
import '../../screens.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import '../widgets/current_location.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> with SingleTickerProviderStateMixin {
  ControlPanelController panelcontroller = Get.put(ControlPanelController());
  late final MapController mapController;
  late PGuardDetailsModel robotdetails;
  List<latLng.LatLng> tappedPoints = [];

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    robotdetails = pGuardDetailsModelFromJson(
        panelcontroller.storage.read("tempRobotModel"));
    mapController = MapController();
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
    var markers = tappedPoints.map((latlng) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => const Icon(
          Icons.location_pin,
          size: 40,
          color: secondaryColor,
        ),
      );
    }).toList();
    markers.add(
      Marker(
        width: 60.0,
        height: 60.0,
        point: latLng.LatLng(robotdetails.data.positionGps!.lat!.obs.toDouble(),
            robotdetails.data.positionGps!.lon!.obs.toDouble()),
        builder: (ctx) => RobotLocationMarker(_animationController),
      ),
    );
    return StreamBuilder(
        stream: panelcontroller.webSocketController.myStreamController.stream,
        builder: (context, snapshot) {
          robotdetails = pGuardDetailsModelFromJson(
              panelcontroller.storage.read("tempRobotModel"));
          var data = json.decode(snapshot.data.toString());

          // // Updating LatLong coordinates
          if (data != null) {
            if ((data["handler"] == "send_data") &&
                (data["data"]["param"] == "position_gps") &&
                (robotdetails.data.positionGps!.lat !=
                        data["data"]["value"]["lat"] ||
                    robotdetails.data.positionGps!.lon !=
                        data["data"]["value"]["lon"])) {
              robotdetails = pGuardDetailsModelFromJson(
                  panelcontroller.storage.read("tempRobotModel"));

              double newLatitude =
                  double.parse("${data["data"]["value"]["lat"]}");
              robotdetails.data.positionGps!.lat = newLatitude;
              //
              double newLongitude =
                  double.parse("${data["data"]["value"]["lon"]}");
              robotdetails.data.positionGps!.lon = newLongitude;

              //
              String stringRobotDetails =
                  pGuardDetailsModelToJson(robotdetails);
              panelcontroller.storage.write("Latitude", newLatitude);
              panelcontroller.storage.write("Longitude", newLongitude);

              panelcontroller.storage
                  .write("tempRobotModel", stringRobotDetails);

              print(
                  "3333333 : updating LatLong to 'lat ': $newLatitude, 'lon ': $newLongitude");
            }
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 8, right: 4),
              child: Stack(children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    onLongPress: _handleLongpress,
                    maxZoom: 18,
                    zoom: 14,
                    rotation: -17.6,
                    center: latLng.LatLng(
                        robotdetails.data.positionGps!.lat!.obs.toDouble(),
                        robotdetails.data.positionGps!.lon!.obs.toDouble()),
                    // center: latLng.LatLng(35.817474095, 10.590916711666667),
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          //MAP : add change map mode on select
                          //dark
                          // "https://api.mapbox.com/styles/v1/enovarobotics/cl33kuile001k14o6jbu4y3p7/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                          //streets
                          // "https://api.mapbox.com/styles/v1/enovarobotics/cl1uqdk43006u14mqg8d3a8b5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",

                          //satelite
                          "https://api.mapbox.com/styles/v1/enovarobotics/cl2ys0ea9001m14m2nw1e7zuw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                      additionalOptions: {
                        'accessToken':
                            "pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                        'id': 'mapbox.mapbox-streets-v8'
                      },
                    ),
                    MarkerLayerOptions(
                      markers: markers,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: CurrentLocation(mapController: mapController),
                ),
              ]),
            ),
          );
        });
  }

  //MAP : homeMap shouldn't have onlongPress -->  move to createMission Screen joystickMode

  void _handleLongpress(TapPosition tapPosition, latLng.LatLng latlng) {
    setState(() {
      tappedPoints.add(latlng);
      print("tapped point $latlng");
      log("Tapped points List $tappedPoints");
    });
  }
}
