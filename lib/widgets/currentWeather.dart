import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget currentWeather(IconData iconData, String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, color: Colors.orange, size: 64),
        SizedBox(
          height: 10,
        ),
        Text(
          "$temp",
          style: TextStyle(
            fontSize: 46,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$location',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    ),
  );
}
