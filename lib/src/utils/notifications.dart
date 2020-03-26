import 'package:meta/meta.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  static final NotificationManager _singleton = NotificationManager._mger();
  final NotificationBuilder builder = NotificationBuilder();

  factory NotificationManager() {
    return _singleton;
  }

  NotificationManager._mger();

  void stopAllNotifications() {
    builder.notifications.cancelAll();
  }

  void showSimpleNotification(String title, String body) {
    showOngoingNotification(
      builder.notifications,
      title: title,
      body: body,
    );
  }

  void showSilentNotification(String title, String body) {
    _showNotification(
      builder.notifications,
      title: title,
      body: body,
      type: _noSound,
    );
  }

  void scheduleNotification(String title, String body, DateTime date) {
    builder.notifications.schedule(
      0,
      title,
      body,
      date,
      _ongoing,
    );
  }
}

class NotificationBuilder {
  FlutterLocalNotificationsPlugin notifications;
  AndroidInitializationSettings settingsAndroid;
  IOSInitializationSettings settingsIOS;

  NotificationBuilder() {
    notifications = FlutterLocalNotificationsPlugin();
    settingsAndroid = AndroidInitializationSettings('icon');
    settingsIOS = IOSInitializationSettings();

    notifications.initialize(
      InitializationSettings(settingsAndroid, settingsIOS),
    );
  }

  void stopAllNotifications() {
    notifications.cancelAll();
  }
}

NotificationDetails get _noSound {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'silent channel id',
    'silent channel name',
    'silent channel description',
    playSound: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showSilentNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  int id = 0,
}) =>
    _showNotification(
      notifications,
      title: title,
      body: body,
      id: id,
      type: _noSound,
    );

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showOngoingNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  int id = 0,
}) =>
    _showNotification(
      notifications,
      title: title,
      body: body,
      id: id,
      type: _ongoing,
    );

Future _showNotification(
  FlutterLocalNotificationsPlugin notifications, {
  @required String title,
  @required String body,
  @required NotificationDetails type,
  int id = 0,
}) =>
    notifications.show(
      id,
      title,
      body,
      type,
    );
