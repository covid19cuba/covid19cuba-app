import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Constants {
  static const String appName = 'Covid19 Cuba Data (Alpha)';
  static const String appLogo = 'assets/images/logo.png';
  static const String diseaseName = 'Covid-19';
  static const Color primaryColor = Color.fromARGB(255, 28, 19, 64);
  static const Color primaryTableColor = Color.fromARGB(200, 28, 19, 64);
  static const int notificationMinutesRange = 1440;
  static const String isOnBoarding = 'isOnBoarding';

  // Notifications ids
  static const int infoUpdateNotification = -1;
  static const int appUpdateNotification = -2;
  static const int clapsNotification = -3;

  // static final Time clapsTime = Time(20, 59, 30);
  static final Time clapsTime = Time(0, 0, 0);
}
