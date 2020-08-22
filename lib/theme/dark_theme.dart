


import 'package:flutter/material.dart';

ThemeData darkTheme(brightness) {
  return ThemeData(
    primarySwatch: Colors.blueGrey,
    backgroundColor: Colors.blueGrey[900],
    cardColor: Colors.black,
    primaryTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.blueGrey[200],
        decorationColor: Colors.blueGrey[50],
      ),
      subtitle2: TextStyle(
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        color: Colors.blueGrey[300],
      ),
      headline1: TextStyle(
        color: Colors.white70,
      ),
    ),
    bottomAppBarColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.blueGrey[200]),
    brightness: brightness,
  );
}