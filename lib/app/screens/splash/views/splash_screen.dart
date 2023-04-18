import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'views.dart';
import 'package:location/location.dart';

class SplashScreen extends StatefulWidget with RouteAware {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // made splashScreen stateful so I can go back to portrait mode
  //CONTROLLER : create controller for splash screen and turn this into Get.view
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    // Get capture the current user location
    LocationData _locationData = await _location.getLocation();
    //MAP : will this value be used ?? if not delete
    // ignore: unused_local_variable
    LatLng currentLatLng =
        LatLng(_locationData.latitude!, _locationData.longitude!);

    // Store the user location in sharedPreferences
    // sharedPreferences.setDouble('latitude', _locationData.latitude!);
    // sharedPreferences.setDouble('longitude', _locationData.longitude!);

    // Get and store the directions API response in sharedPreferences
    // for (int i = 0; i < restaurants.length; i++) {
    //   Map modifiedResponse = await getDirectionsAPIResponse(currentLatLng, i);
    //   saveDirectionsAPIResponse(i, json.encode(modifiedResponse));
    // }

    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (_) => const HomeManagement()),
    //     (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
