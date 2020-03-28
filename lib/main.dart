import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/app.dart';
import 'package:covid19cuba/src/utils/utils.dart';

import 'src/data_providers/notifications_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  await PrefService.init();

  await NotificationManager.initialize();

  await setUpTasks();

  var notifications = getApplicationNotifications();
  notifications.forEach((notif) => NotificationManager.schedule(
        id: notif.id,
        scheduledDate: notif.scheduledDate,
        title: notif.title,
        body: notif.body,
      ));
  

  return runApp(App());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(transition.toString());
  }
}
