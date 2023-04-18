// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import '../camera.dart';

class FullVideoScreen extends StatefulWidget {
  VlcPlayerController videoController;
  FullVideoScreen({Key? key, required this.videoController}) : super(key: key);

  @override
  State<FullVideoScreen> createState() => _FullVideoScreenState();
}

class _FullVideoScreenState extends State<FullVideoScreen> {
  //CONTROLLER: fullVideoScreen()
  @override
  void initState() {
    super.initState();
    print("video controllerrr : ${widget.videoController}");
    widget.videoController.initialize();
    //TESTI video : will video still play if going in and out full screen more than once
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Stack(clipBehavior: Clip.none,
            // overflow: Overflow.visible,
            children: [
              Container(
                //SIZE : add size
                child: BuildAnimatedVideo(
                    widget.videoController, 300, 600), //double.infinity
              ),
              Positioned(
                bottom: -10,
                right: 50,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () {
                      widget.videoController.dispose();
                      navigator!.pop();
                    },
                    icon: Icon(
                      Icons.fullscreen_exit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
