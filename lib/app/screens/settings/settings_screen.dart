// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 147, 69, 0),
      child: Center(
        child: Text(
          "Settings",
          style: TextStyle(
              color: Color.fromARGB(255, 201, 192, 192), fontSize: 24),
        ),
      ),
    );
  }
}
