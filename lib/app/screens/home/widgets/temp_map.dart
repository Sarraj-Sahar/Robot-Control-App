// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../home.dart';

Widget tempMap() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8, right: 4),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 141, 168, 98),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Positioned(bottom: 0.0, right: 0.0, child: LightButton())
      ]),
    ),
  );
}
