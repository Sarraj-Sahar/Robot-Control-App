import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

Color setBatteryColor(batteryLevel) {
  if (batteryLevel <= 35) {
    return const Color.fromARGB(255, 236, 193, 64);
  } else if (batteryLevel <= 20) {
    return const Color.fromARGB(255, 192, 59, 59);
  } else {
    return Colors.green;
  }
}

IconData setBatteryIcon(batteryLevel) {
  if (batteryLevel <= 90) {
    return MaterialCommunityIcons.battery_90;
  } else if (batteryLevel <= 80) {
    return MaterialCommunityIcons.battery_80;
  } else if (batteryLevel <= 70) {
    return MaterialCommunityIcons.battery_70;
  } else if (batteryLevel <= 60) {
    return MaterialCommunityIcons.battery_60;
  } else if (batteryLevel <= 50) {
    return MaterialCommunityIcons.battery_50;
  } else if (batteryLevel <= 40) {
    return MaterialCommunityIcons.battery_40;
  } else if (batteryLevel <= 30) {
    return MaterialCommunityIcons.battery_30;
  } else if (batteryLevel <= 20) {
    return MaterialCommunityIcons.battery_20;
    // return MaterialCommunityIcons.battery_low;

  } else if (batteryLevel <= 10) {
    return MaterialCommunityIcons.battery_10;
  } else if (batteryLevel == 0) {
    return MaterialCommunityIcons.battery_low;
  } else {
    return MaterialCommunityIcons.battery;
  }
}
