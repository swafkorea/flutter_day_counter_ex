import 'package:flutter/material.dart';

/// theme 설정 function
ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Sunflower',
    primarySwatch: Colors.pink,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.pink[900],
        fontFamily: 'Parisienne',
        fontSize: 80,
        fontWeight: FontWeight.w900,
      ),
      headline2: const TextStyle(
        color: Colors.pink,
        fontSize: 50,
        fontWeight: FontWeight.w700,
      ),
      bodyText1: const TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
      bodyText2: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}
