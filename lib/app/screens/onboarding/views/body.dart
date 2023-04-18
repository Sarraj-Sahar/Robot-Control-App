// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:p_guard/app/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/display_data.dart';

class OnBoardingBody extends StatefulWidget {
  OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _BodyState();
}

class _BodyState extends State<OnBoardingBody> {
  //Two Page Controllers : one for images and one for descriptions (text)
  PageController _imagePageController = PageController();
  PageController _textPageController = PageController();

  @override
  initState() {
    super.initState();

    _textPageController = PageController(initialPage: 0, viewportFraction: 1);
    _imagePageController = PageController(initialPage: 0)
      ..addListener(_onMainScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _textPageController.dispose();
    _imagePageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //Display Images
      SizedBox(
        width: double.infinity,
        height: size.height * 0.26,
        child: PageView.builder(
          controller: _imagePageController,
          scrollDirection: Axis.horizontal,
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Image.asset(displayList[index].image),
            );
          },
        ),
      ),
      SizedBox(
        height: size.height * 0.1,
      ),
      SmoothPageIndicator(
        controller: _imagePageController,
        count: displayList.length,
        effect: ExpandingDotsEffect(
          activeDotColor: secondaryColor,
          dotColor: Colors.white,
          dotHeight: 10,
          dotWidth: 15,
          spacing: 7,
        ),
      ),
      SizedBox(
        height: size.height * 0.05,
      ),

      //Display Description
      SizedBox(
        height: size.height * 0.17,
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _textPageController,
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
              child: Text(
                displayList[index].description,
                style: const TextStyle(color: signFormColor),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),

      //Display Theme button on last page
      SizedBox(
        height: size.height * 0.05,
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _textPageController,
          itemCount: displayList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
              ),
              child: displayList[index].button,
            );
          },
        ),
      ),
    ]);
  }

  //when user scrolls images, descriptions also scroll automatically
  _onMainScroll() {
    _textPageController.animateTo(_imagePageController.offset,
        duration: const Duration(milliseconds: 150), curve: Curves.decelerate);
  }
}
