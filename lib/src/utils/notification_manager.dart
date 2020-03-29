import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

class NotificationManager {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static AndroidInitializationSettings androidInitializationSettings;
  static IOSInitializationSettings iOSInitializationSettings;
  static AndroidNotificationDetails androidNotificationDetails;
  static IOSNotificationDetails iOSNotificationDetails;
  static NotificationDetails notificationDetails;
  static bool isInitialized;

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
    androidNotificationDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.Max,
      priority: Priority.High,
      style: AndroidNotificationStyle.BigText,
      ongoing: false,
    );
    iOSNotificationDetails = IOSNotificationDetails();
    notificationDetails = NotificationDetails(
      androidNotificationDetails,
      iOSNotificationDetails,
    );
    androidInitializationSettings = AndroidInitializationSettings(
      androidDefaultIcon,
    );
    iOSInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: iOSRequestAlertPermission,
      requestSoundPermission: iOSRequestSoundPermission,
      requestBadgePermission: iOSRequestBadgePermission,
      defaultPresentAlert: iOSDefaultPresentAlert,
      defaultPresentSound: iOSDefaultPresentSound,
      defaultPresentBadge: iOSDefaultPresentBadge,
      onDidReceiveLocalNotification: iOSOnDidReceiveLocalNotification,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    isInitialized = await flutterLocalNotificationsPlugin.initialize(
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
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails ?? NotificationManager.notificationDetails,
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
    await flutterLocalNotificationsPlugin.schedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails ?? NotificationManager.notificationDetails,
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
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      repeatInterval,
      notificationDetails ?? NotificationManager.notificationDetails,
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
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      id,
      title,
      body,
      notificationTime,
      notificationDetails ?? NotificationManager.notificationDetails,
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
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      id,
      title,
      body,
      day,
      notificationTime,
      notificationDetails ?? NotificationManager.notificationDetails,
      payload: payload,
    );
  }

  static Future<List<PendingNotificationRequest>>
      pendingNotificationRequests() async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return null;
    }
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  static Future<bool> iOSRequestPermissions() async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return false;
    }
    // If not platform is iOS return true
    return await flutterLocalNotificationsPlugin
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
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAll() async {
    if (!isInitialized) {
      log('Notification Manager not is initialized');
      return;
    }
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
