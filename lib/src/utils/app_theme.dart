// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData.light().copyWith(
    primaryColor: Constants.primaryColor,
    accentColor: Colors.red,
    primaryTextTheme: TextTheme(
      overline: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      caption: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline1: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Constants.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
