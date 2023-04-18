// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class MyBase extends StatelessWidget {
  const MyBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: new BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        // gradient: RadialGradient(
        //   center: Alignment(lightSource.dx, widget.lightSource.dy),
        //   colors: const [Colors.grey, Color.fromARGB(255, 35, 34, 34)], //black
        // ),
        // border: Border.all(
        //   // color: Colors.lightGreenAccent[400]!,
        //   color: Color.fromARGB(255, 35, 34, 34), width: 5,
        // ),
        shape: BoxShape.circle,
      ),
      child: Stack(children: [
        Positioned(
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Colors.lightGreenAccent[400],
              // color: Color.fromARGB(255, 61, 236, 66),
            ),
          ),
          top: 25,
          right: 60,
        ),
        Positioned(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
          top: 80,
          left: 0.0,
        ),
        Positioned(
          child: Icon(
            Icons.arrow_forward_ios,
            size: 30,
            color: Colors.white.withOpacity(0.8),
          ),
          top: 80,
          right: 0.0,
        ),
        Positioned(
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          bottom: 25,
          right: 60,
        ),
      ]),
    );
  }
}
