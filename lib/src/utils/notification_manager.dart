// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'functions.dart';

class NotificationManager {
  static FlutterLocalNotificationsPlugin plugin;
  static bool isInitialized;

  static NotificationDetails getDetails(String text) {
    var androidNotificationDetails = AndroidNotificationDetails(
      'Regular',
      'Regular Notifications',
      'Sound and vibrate notifications',
      importance: Importance.Max,
      priority: Priority.High,
      styleInformation: BigTextStyleInformation(text),
      ongoing: false,
      playSound: true,
      enableVibration: true,
    );
    var iOSNotificationDetails = IOSNotificationDetails();
    
    var notificationDetails = NotificationDetails(
      checkDoNotDisturbTime() ? silentProfile : androidNotificationDetails,
      iOSNotificationDetails,
    );
    return notificationDetails;
  }

  static AndroidNotificationDetails silentProfile = AndroidNotificationDetails(
    'Silent',
    'Silen Profile',
    'Low priority and noise',
    importance: Importance.Low,
    priority: Priority.Low,
    ongoing: false,
    playSound: false,
    enableVibration: false,
    enableLights: false,
  );

  static Future<bool> initialize({
    String androidDefaultIcon = 'mipmap/ic_launcher',
    bool iOSRequestAlertPermission = true,
    bool iOSRequestSoundPermission = true,
    bool iOSRequestBadgePermission = true,
    bool iOSDefaultPresentAlert = true,
    bool iOSDefaultPresentSound = true,
    bool iOSDefaultPresentBadge = true,
    DidReceiveLocalNotificationCallback iOSOnDidReceiveLocalNotification,
    SelectNotificationCallback onSelectNotification,
  }) async {
    var androidInitializationSettings = AndroidInitializationSettings(
      androidDefaultIcon,
    );
    var iOSInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: iOSRequestAlertPermission,
      requestSoundPermission: iOSRequestSoundPermission,
      requestBadgePermission: iOSRequestBadgePermission,
      defaultPresentAlert: iOSDefaultPresentAlert,
      defaultPresentSound: iOSDefaultPresentSound,
      defaultPresentBadge: iOSDefaultPresentBadge,
      onDidReceiveLocalNotification: iOSOnDidReceiveLocalNotification,
    );
    plugin = FlutterLocalNotificationsPlugin();
    isInitialized = await plugin.initialize(
      InitializationSettings(
        androidInitializationSettings,
        iOSInitializationSettings,
      ),
      onSelectNotification: onSelectNotification,
    );
    return isInitialized;
  }

  static Future<void> show({
    int id = 0,
    @required String title,
    @required String body,
    NotificationDetails notificationDetails,
    String payload,
  }) async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.show(
      id,
      title,
      body,
      notificationDetails ??  getDetails(body),
      payload: payload,
    );
  }

  static Future<void> schedule({
    int id = 0,
    @required String title,
    @required String body,
    @required DateTime scheduledDate,
    NotificationDetails notificationDetails,
    String payload,
    androidAllowWhileIdle = false,
  }) async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.schedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails ?? getDetails(body),
      payload: payload,
      androidAllowWhileIdle: androidAllowWhileIdle,
    );
  }

  static Future<void> periodicallyShow({
    int id = 0,
    @required String title,
    @required String body,
    @required RepeatInterval repeatInterval,
    NotificationDetails notificationDetails,
    String payload,
  }) async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.periodicallyShow(
      id,
      title,
      body,
      repeatInterval,
      notificationDetails ?? getDetails(body),
      payload: payload,
    );
  }

  static Future<void> showDailyAtTime({
    int id = 0,
    @required String title,
    @required String body,
    @required Time notificationTime,
    NotificationDetails notificationDetails,
    String payload,
  }) async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.showDailyAtTime(
      id,
      title,
      body,
      notificationTime,
      notificationDetails ?? getDetails(body),
      payload: payload,
    );
  }

  static Future<void> showWeeklyAtDayAndTime({
    int id = 0,
    @required String title,
    @required String body,
    @required Day day,
    @required Time notificationTime,
    NotificationDetails notificationDetails,
    String payload,
  }) async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.showWeeklyAtDayAndTime(
      id,
      title,
      body,
      day,
      notificationTime,
      notificationDetails ?? getDetails(body),
      payload: payload,
    );
  }

  static Future<List<PendingNotificationRequest>>
      pendingNotificationRequests() async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return null;
    }
    return await plugin.pendingNotificationRequests();
  }

  static Future<bool> iOSRequestPermissions() async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return false;
    }
    // If not platform is iOS return true
    return await plugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            ) ??
        true;
  }

  static Future<void> cancel(int id) async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.cancel(id);
  }

  static Future<void> cancelAll() async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await plugin.cancelAll();
  }
}
