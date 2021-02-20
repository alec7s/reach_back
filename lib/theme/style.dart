import 'package:flutter/material.dart';

//TODO: FINALIZE AND APPLY THEME THROUGHOUT APP
//TODO: ADD FONTS
ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.redAccent,
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
    buttonColor: Colors.white24,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
