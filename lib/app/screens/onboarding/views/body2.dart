// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

//CHANGEME : This is a sample onboarding screen from YOUTUBE
// Undrestand page indicator controller stucture  and DELETE THIS !!!

import 'package:flutter/material.dart';
import '../widgets/display_data.dart';

class Body2 extends StatefulWidget {
  Body2({Key? key}) : super(key: key);

  @override
  State<Body2> createState() => _BodyState();
}

class _BodyState extends State<Body2> {
///////
  final PageController _controller = PageController();
  int _currentPage = 0;

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: displayList.length,
            itemBuilder: (context, int index) {
              {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Image.asset(displayList[index].image),
                );
              }
            }),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List<Widget>.generate(displayList.length, (int index) {
                  return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? Colors.blue
                              : Colors.blue.withOpacity(0.5)));
                })),
            InkWell(
              onTap: () {
                _controller.nextPage(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOutQuint);
              },
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: Duration(milliseconds: 300),
                height: 70,
                width: (_currentPage == (displayList.length - 1)) ? 200 : 75,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(35)),
                child: (_currentPage == (displayList.length - 1))
                    ? Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    : Icon(
                        Icons.navigate_next,
                        size: 50,
                        color: Colors.white,
                      ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ],
    );
  }

  //when user scrolls images, descriptions also scroll automatically

}
