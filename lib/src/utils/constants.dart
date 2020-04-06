import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Constants {
  static const String appName = 'Covid19 Cuba Data (Alpha)';
  static const String appLogo = 'assets/images/logo.png';
  static const String diseaseName = 'Covid-19';
  static const Color primaryColor = Color.fromARGB(255, 28, 19, 64);
  static const int notificationMinutesRange = 1440;
    static const int setUpTasksMinutesDefault = 15;

  static const String defaultCompareCountry = 'Hungary';
  static const String countryCuba = 'Cuba';

  //Shared preferences
  static const String prefIsOnBoarding = 'isOnBoarding';
  static const String prefCompareCountry = 'compareCountry';
  static const String prefConnectionMode = 'connectionMode';
  static const String prefLastDataUpdate = 'lastDataUpdate';
  static const String prefSetUpTasksMinutes = 'setUpTasksMinutes';

  //Connection Modes
  static const int ConnectionModeIntranet = 0;
  static const int ConnectionModeInternet = 1;
  static const int ConnectionModeMerge = 2;

  // Notifications ids
  static const int infoUpdateNotification = -1;
  static const int appUpdateNotification = -2;
  static const int clapsNotification = -3;

  static Time clapsTime = Time(20, 55, 00);
}
