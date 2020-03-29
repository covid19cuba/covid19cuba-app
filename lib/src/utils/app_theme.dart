import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData.light().copyWith(
    primaryColor: Constants.primaryColor,
    accentColor: Colors.red,
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      body2: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      display1: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      display2: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      display3: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      display4: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      overline: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      subhead: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
