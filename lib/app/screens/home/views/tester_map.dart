// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

//MAP : see testerMap() fct of going to saved places and delete this
class TesterMap extends StatefulWidget {
  static const String route = 'map_controller';
  const TesterMap({Key? key}) : super(key: key);

  @override
  MapControllerPageState createState() {
    return MapControllerPageState();
  }
}

class MapControllerPageState extends State<TesterMap> {
  static LatLng london = LatLng(51.5, -0.09);
  static LatLng paris = LatLng(48.8566, 2.3522);
  static LatLng dublin = LatLng(53.3498, -6.2603);

  late final MapController mapController;
  double rotation = 0.0;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: london,
        builder: (ctx) => Container(
          key: Key('blue'),
          child: FlutterLogo(),
        ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: dublin,
        builder: (ctx) => FlutterLogo(
          key: Key('green'),
          textColor: Colors.green,
        ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: paris,
        builder: (ctx) => Container(
          key: Key('purple'),
          child: FlutterLogo(textColor: Colors.purple),
        ),
      ),
    ];

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      mapController.move(london, 18.0);
                    },
                    child: Text('London'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      mapController.move(paris, 5.0);
                    },
                    child: Text('Paris'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      mapController.move(dublin, 5.0);
                    },
                    child: Text('Dublin'),
                  ),
                  CurrentLocation(mapController: mapController),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            //   child: Row(
            //     children: <Widget>[
            //       MaterialButton(
            //         onPressed: () {
            //           var bounds = LatLngBounds();
            //           bounds.extend(dublin);
            //           bounds.extend(paris);
            //           bounds.extend(london);
            //           mapController.fitBounds(
            //             bounds,
            //             options: FitBoundsOptions(
            //               padding: EdgeInsets.only(left: 15.0, right: 15.0),
            //             ),
            //           );
            //         },
            //         child: Text('Fit Bounds'),
            //       ),
            //       Builder(builder: (BuildContext context) {
            //         return MaterialButton(
            //           onPressed: () {
            //             final bounds = mapController.bounds!;

            //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //               content: Text(
            //                 'Map bounds: \n'
            //                 'E: ${bounds.east} \n'
            //                 'N: ${bounds.north} \n'
            //                 'W: ${bounds.west} \n'
            //                 'S: ${bounds.south}',
            //               ),
            //             ));
            //           },
            //           child: Text('Get Bounds'),
            //         );
            //       }),
            //       Text('Rotation:'),
            //       Expanded(
            //         child: Slider(
            //           value: rotation,
            //           min: 0.0,
            //           max: 360,
            //           onChanged: (degree) {
            //             setState(() {
            //               rotation = degree;
            //             });
            //             mapController.rotate(degree);
            //           },
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Flexible(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 15.0,
                  maxZoom: 18.4,
                  minZoom: 3.0,
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
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({
    Key? key,
    required this.mapController,
  }) : super(key: key);

  final MapController mapController;

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final int _eventKey = 0;

  var icon = Icons.gps_not_fixed;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setIcon(IconData newIcon) {
    if (newIcon != icon && mounted) {
      setState(() {
        icon = newIcon;
      });
    }
  }

  // void onMapEvent(MapEvent mapEvent) {
  //   if (mapEvent is MapEventMove && mapEvent.id == _eventKey.toString()) {
  //     setIcon(Icons.gps_not_fixed);
  //   }
  // }

  void _moveToCurrent() async {
    // _eventKey++;
    var location = Location();

    try {
      var currentLocation = await location.getLocation();
      var moved = widget.mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        18,
        id: _eventKey.toString(),
      );

      if (moved) {
        setIcon(Icons.gps_fixed);
      } else {
        setIcon(Icons.gps_not_fixed);
      }
    } catch (e) {
      setIcon(Icons.gps_off);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: _moveToCurrent,
    );
  }
}
