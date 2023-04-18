import 'package:flutter/material.dart';

class SpinningWheel extends StatefulWidget {
  const SpinningWheel({Key? key}) : super(key: key);

  @override
  State<SpinningWheel> createState() => _SpinningWheelState();
}

class _SpinningWheelState extends State<SpinningWheel>
    with TickerProviderStateMixin {
// Controller
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: false);

// Animation
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//Used Rotation Transition widget to rotate image

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      // child: Image.asset("assets/images/wheel.png"),
      child: Image.asset("assets/images/darkwheel.png"),
    );
  }
}
