// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:background_fetch/background_fetch.dart';
import 'package:covid19cuba/src/models/charts/state_model.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:demoji/demoji.dart';
import 'package:preferences/preferences.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart' as tz;

void appTask(String taskId, [bool headless = false]) async {
  if (headless) {
    await NotificationManager.initialize();
    await PrefService.init();
  }

  List<bool> currentInfo;
  try {
    currentInfo = await StateModel.check();
  } catch (e) {
    log(e.toString());
  }

  if (clapsTime()) {
    await showClaps();
  } else if (currentInfo != null && timeToShowNotifications()) {
    bool upgrade =
        PrefService.getBool(Constants.prefFirstVersionNotification) ?? true;
    if (currentInfo[0] && currentInfo[2] && upgrade) {
      PrefService.setBool(Constants.prefFirstVersionNotification, false);
      NotificationManager.show(
        title: 'Actualización!',
        body: 'Covid19 Cuba Data posee una nueva versión. '
            'No te pierdas las nuevas características.',
        id: Constants.appUpdateNotification,
      );
    } else if (currentInfo[1]) {
      if (currentInfo[3]) {
        if (PrefService.getBool(Constants.prefFirstCacheNotification) ?? true) {
          if (PrefService.getBool(Constants.prefDailyUpdateNotifications) ??
              true) {
            PrefService.setBool(Constants.prefFirstCacheNotification, false);
            NotificationManager.show(
              title: 'Nueva Información!',
              body: 'Los datos del parte diario se han actualizado. '
                  'Póngase al día. Toque para revisar.',
              id: Constants.infoUpdateNotification,
            );
          }
        }
      } else {
        if (PrefService.getBool(Constants.prefFirstModificationNotification) ??
            true) {
          if (PrefService.getBool(Constants.prefInfoUpdateNotifications) ??
              true) {
            PrefService.setBool(
                Constants.prefFirstModificationNotification, false);
            NotificationManager.show(
              title: 'Cambios Realizados!',
              body: 'Los datos se han actualizado. '
                  'Hemos mejorado los datos disponibles. Toque para revisar.',
              id: Constants.infoUpdateNotification,
            );
          }
        }
      }
    }
  } else {
    log('Null info recieved during foreground / background task');
  }
  BackgroundFetch.finish(taskId);
}

void appHeadlessTask(String taskId) async {
  return appTask(taskId, true);
}

Future<void> setUpTasks(
    [int minutes = Constants.setUpTasksMinutesDefault]) async {
  await TaskManager.initialize(minutes, appTask);
}

Future<void> setUpBackgroundTasks() async {
  await TaskManager.setHeadlessTask(appHeadlessTask);
}

Future<void> showClaps() async {
  String claps = Demoji.clap +
      Demoji.clap +
      Demoji.clap +
      Demoji.clap +
      Demoji.clap +
      Demoji.clap +
      Demoji.clap +
      Demoji.clap;

  await NotificationManager.show(
    id: Constants.clapsNotification,
    title: 'Tiempo de aplausos!!!!!' + claps,
    body:
        'Ya casi es la hora de los aplausos. Súmate al agradecimiento para quienes trabajan por la salud y seguridad de todos. \n' +
            claps +
            claps,
  );
}

bool timeToShowNotifications() {
  DateTime moment = DateTime.now();
  return moment.hour < Constants.startSilentTime &&
      moment.hour > Constants.endSilentTime;
}

bool clapsTime() {
  if (PrefService.getBool(Constants.prefClapsNotifications) ?? true) {
    tz.initializeTimeZones();
    final havana = getLocation('America/Havana');
    final havanaTime = new TZDateTime.now(havana);
    DateTime date = havanaTime;
    return date.hour >= Constants.startClapsHour &&
        date.minute >= Constants.startClapsMinute &&
        date.hour < Constants.stopClapsHour;
  }
  return false;
}
