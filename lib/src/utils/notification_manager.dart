import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

AndroidNotificationDetails silent_channel = AndroidNotificationDetails(
  'Notifications',
  'Silent Notifications',
  'Non annoying notifications',
  importance: Importance.Default,
  priority: Priority.Low,
  style: AndroidNotificationStyle.BigText,
  ongoing: false,
  enableVibration: false,
  playSound: false,

);

AndroidNotificationDetails noise_channel = AndroidNotificationDetails(
  'Notifications',
  'Regular Notifications',
  'Important notifications',
  importance: Importance.High,
  priority: Priority.High,
  style: AndroidNotificationStyle.BigText,
  ongoing: false,
  enableVibration: true,
  playSound: true,
);

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
    bool silentNotifications = false,
    DidReceiveLocalNotificationCallback iOSOnDidReceiveLocalNotification,
    SelectNotificationCallback onSelectNotification,

  } ) async {
    androidNotificationDetails = silentNotifications ? silent_channel : noise_channel;
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
      log('Notification Manager is not initialized');
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
      log('Notification Manager is not initialized');
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
      log('Notification Manager is not initialized');
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
      log('Notification Manager is not initialized');
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
      log('Notification Manager is not initialized');
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
      log('Notification Manager is not initialized');
      return null;
    }
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  static Future<bool> iOSRequestPermissions() async {
    if (!isInitialized) {
      log('Notification Manager is not initialized');
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
      log('Notification Manager is not initialized');
      return;
    }
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAll() async {
    if (!isInitialized) {
      log('Notification Manager is not initialized');
      return;
    }
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
