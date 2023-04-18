import 'package:flutter/material.dart';

class SphereDensity extends StatefulWidget {
  final double diameter;
  final Offset lightSource;
  final Widget child;
  const SphereDensity(
      {Key? key,
      required this.child,
      required this.diameter,
      required this.lightSource})
      : super(key: key);

  @override
  _SphereDensityState createState() => _SphereDensityState();
}

class _SphereDensityState extends State<SphereDensity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, //this.widget.diameter,
      height: 80, //this.widget.diameter,

      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(widget.lightSource.dx, widget.lightSource.dy),
          colors: const [Colors.grey, Color.fromARGB(255, 35, 34, 34)], //black
        ),
      ),
      child: widget.child,
      // widget.child and NOT this.child --> bcz this is a stateful widget
    );
  }
}
