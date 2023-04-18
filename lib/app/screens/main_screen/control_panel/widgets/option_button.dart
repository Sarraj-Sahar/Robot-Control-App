// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:p_guard/app/size_config.dart';

class OptionButton extends StatelessWidget {
  String? title;
  IconData? icon;
  double? iconSize;
  Color? iconColor;
  String? myroute;
  VoidCallback? kOnTap;

  OptionButton({
    Key? key,
    this.title,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.myroute,
    this.kOnTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.186,
      color: Colors.white,
      child: ElevatedButton(
        onPressed: kOnTap,
        style: optionButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: RotatedBox(
                  quarterTurns: (icon == Icons.battery_full) ? 1 : 0,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  )),
            ),
            Text(title!),
          ],
        ),
      ),
    );
  }
}
