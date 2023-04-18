// ignore_for_file: library_prefixes, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart' as latLng;

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
  int _eventKey = 0;
  final GetStorage storage = GetStorage();
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
    _eventKey++;
    var location = Location();

    try {
      //MAP: use this to get user Location or delete it
      var currentLocation = await location.getLocation();

      double latitude = storage.read("Latitude");
      double longitude = storage.read("Longitude");

      var moved = widget.mapController.move(
        // latLng.LatLng(currentLocation.latitude!, currentLocation.longitude!),

//TESTI : print ("current robot lat,long: $latitude , $longitude") , is it printing 0,0 ?
        latLng.LatLng(latitude, longitude),
        /////////////////////
        // latLng.LatLng(
        //     _HomeMapState().robotdetails.data.positionGps!.lat!.obs.toDouble(),
        //     _HomeMapState().robotdetails.data.positionGps!.lon!.obs.toDouble()),
        17,
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
      iconSize: 50,
      icon: Icon(icon),
      onPressed: _moveToCurrent,
    );
  }
}
