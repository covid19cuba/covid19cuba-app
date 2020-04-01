import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Constants {
  static String appName = 'Covid19 Cuba Data (Alpha)';
  static String appLogo = 'assets/images/logo.png';
  static String diseaseName = 'Covid-19';
  static Color primaryColor = Color.fromARGB(255, 28, 19, 64);
  static int notificationMinutesRange = 1440;
  static String isOnBoarding = 'isOnBoarding';

  // Notifications ids
  static int infoUpdateNotification = -1;
  static int appUpdateNotification = -2;
  static int clapsNotification = -3;

  static Time clapsTime = Time(20, 59, 30);
}
