// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'd_curved.dart';
import 'sphere_density.dart';

class SphereBall extends StatefulWidget {
  const SphereBall({Key? key}) : super(key: key);

  @override
  _SphereBallState createState() => _SphereBallState();
}

class _SphereBallState extends State<SphereBall> {
  static const lightSource = Offset(0, -0.75);

  //Movement
  static const restPosition = Offset(0, -0.15);

  @override
  Widget build(BuildContext context) {
    //TODO : finish magic 3d ball
    // ignore: unused_local_variable
    const windowPosition = restPosition;

    final size = Size.square(MediaQuery.of(context).size.shortestSide);

    return SphereDensity(
        lightSource: lightSource,
        diameter: size.shortestSide,
        // child: Transform(
        //   origin: size.center(Offset.fromDirection(-10)),
        //   transform: Matrix4.identity()..scale(0.5),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: DCurved(
              lightsource: lightSource,
            ),
          ),
        ));
  }
}
