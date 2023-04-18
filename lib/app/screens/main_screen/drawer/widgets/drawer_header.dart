// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

Widget buildDrawerHeader(
    {required String username, required String useremail}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/guard.png'),
            ),
          ),
        ),
        Text(
          username,
          style:
              TextStyle(color: Color.fromARGB(255, 20, 20, 20), fontSize: 20),
        ),
        Text(
          useremail,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
