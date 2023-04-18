import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';

Widget buildDrawerItem({
  required String text,
  required IconData icon,
  required Color textIconColor,
  required Color? tileColor,
  required void Function() onTap,
}) {
  return ListTile(
    leading: CircleAvatar(
        backgroundColor: secondaryColor, child: Icon(icon, color: tileColor)),
    title: Text(
      text,
      style: TextStyle(color: textIconColor),
    ),
    tileColor: tileColor,
    onTap: onTap,
  );
}
