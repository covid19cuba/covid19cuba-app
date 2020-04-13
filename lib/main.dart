import 'dart:developer';

import 'package:covid19cuba/src/models/models.dart';
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

  var update = await checkUpdate();

  await setUpTasks();

  /*int setUpTasksMinutes;
  try {
    setUpTasksMinutes = PrefService.getInt(Constants.prefSetUpTasksMinutes);
  } catch (e) {
    log(e.toString());
    setUpTasksMinutes = Constants.setUpTasksMinutesDefault;
  }

  await setUpTasks(setUpTasksMinutes);

  await setUpClapsTime();*/

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

  runApp(App(update));

  await setUpBackgroundTasks();
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(transition.toString());
  }
}

Future<bool> checkUpdate() async {
  try {
    var state = await StateModel.check();
    if (state != null) {
      return state[0] && state[2];
    }
  } catch (e) {
    log(e.toString());
  }
  return false;
}
