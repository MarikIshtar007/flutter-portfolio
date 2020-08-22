import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData brightTheme(brightness) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.blueGrey[50],
    textTheme: TextTheme(
      button: TextStyle(
        color: Colors.blueGrey,
        decorationColor: Colors.blueGrey[300],
      ),
      subtitle2: TextStyle(
        color: Colors.blueGrey[900],
      ),
      subtitle1: TextStyle(
        color: Colors.black,
      ),
      headline1: TextStyle(color: Colors.blueGrey[800]),
    ),
    bottomAppBarColor: Colors.blueGrey[900],

    appBarTheme: AppBarTheme(
      color: Colors.white,
      textTheme: TextTheme(
        headline6: GoogleFonts.alata(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 40.0
        )
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      )
    ),
    iconTheme: IconThemeData(color: Colors.blueGrey),
  );
}
