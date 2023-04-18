// ignore_for_file: library_prefixes

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:p_guard/app/screens/screens.dart';
import '../../../constants/constants.dart';

class MapPlaceHolder extends StatelessWidget {
  const MapPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // SizedBox(
          //   width: size.width * 0.38,
          child: Column(
            children: const [
              Center(
                child: Text(
                  "Scenarios List no data",
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
          // flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 18.0, right: 8.0, left: 8.0, bottom: 8.0),
            child: Stack(children: [
              FlutterMap(
                // mapController: _mapctl,
                options: MapOptions(
                  maxZoom: 18,
                  zoom: 18,
                  rotation: -17.6,
                  // center: latLng.LatLng(
                  //     robotdetails.data.positionGps!.lat!.obs.toDouble(),
                  //     robotdetails.data.positionGps!.lon!.obs.toDouble()),
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        // "https://api.mapbox.com/styles/v1/enovarobotics/cl1uqdk43006u14mqg8d3a8b5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                        "https://api.mapbox.com/styles/v1/enovarobotics/cl2ys0ea9001m14m2nw1e7zuw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                    additionalOptions: {
                      'accessToken':
                          "pk.eyJ1IjoiZW5vdmFyb2JvdGljcyIsImEiOiJjbDF1b2s3ZnAybmE2M2Z0YzJhdWp2Zzg4In0.r_ZHsbB8_SMLDNDZb75URA",
                      'id': 'mapbox.mapbox-streets-v8'
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                          width: 60.0,
                          height: 60.0,
                          point: latLng.LatLng(35.81723054166667, 10.591517465),
                          builder: (ctx) => const SpinningWheel()
                          // RobotLocationMarker(_animationController),
                          ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 10,
                bottom: 0.0,
                child: ElevatedButton(
                  child: const Text("+  Add Scenario"),
                  style: loginButtonStyle,
                  onPressed: () {
                    log("not connecteddddd");
                  },
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
