// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

Widget HomeVideosColumn(controller1, Size size, controller2) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: videoController(controller1, size),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Expanded(flex: 1, child: videoController(controller2, size)),
        ],
      ),
    ),
  );
}
