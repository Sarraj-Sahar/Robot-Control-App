import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'option_button.dart';

Widget controlPanelPlaceholder() {
  return Row(children: [
    OptionButton(
      title: 'null',
      iconSize: 30.0,
      icon: MaterialCommunityIcons.battery,
    ),
    // ),
    OptionButton(
      title: "Teleop",
      icon: Icons.sports_esports_outlined,
      iconSize: 30,
    ),

    //
    OptionButton(
      title: "Connected",
      icon: Icons.circle,
      iconSize: 18,
    ),

    //
    OptionButton(
      title: "RTK",
      icon: Icons.gps_fixed,
      iconSize: 25,
    ),

    //
    OptionButton(
      title: "Emergency",
      icon: Icons.stop_circle_outlined,
      iconSize: 22,
    ),
  ]);
}
