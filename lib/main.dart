import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/app.dart';
import 'package:covid19cuba/src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  await PrefService.init();

  await NotificationManager.initialize();

  await setUpTasks();

  // TODO: Bug in advice notifications, meanwhile they should be disabled
  /*var notifications = getApplicationNotifications();
  notifications.forEach(
    (notification) => NotificationManager.schedule(
      id: notification.id,
      scheduledDate: notification.scheduledDate,
      title: notification.title,
      body: notification.body,
    ),
  );*/

  return runApp(App());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(transition.toString());
  }
}
