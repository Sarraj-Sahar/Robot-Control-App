// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DCurved extends StatelessWidget {
  final Offset lightsource;
  const DCurved({Key? key, required this.lightsource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final innerShadowWidth = lightsource.distance * 0.15;
    return Container(
      width: 80, //this.widget.diameter,
      height: 80, //this.widget.diameter,

      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        gradient: RadialGradient(
          /* center:
              Alignment(this.widget.lightSource.dx, this.widget.lightSource.dy),*/
          stops: [
            1 - innerShadowWidth,
            1,
          ],
          colors: const [Color(0x661F1F1F), Color.fromARGB(255, 35, 34, 34)],
          // colors: const [Color(0x661F1F1F), Colors.green],
        ),
      ),
    );
  }
}
