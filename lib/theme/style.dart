import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData appTheme(bool isItDark) {
  return ThemeData(
    primaryColor: Color(0xff282929),
    accentColor: Color(0xfff19b38),
    backgroundColor: isItDark ? Colors.black : Colors.white,
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.pink),
        headline2: TextStyle(
          fontSize: 10,
        )),
  );
}
