import 'dart:developer';

import 'package:background_fetch/background_fetch.dart';
import 'package:demoji/demoji.dart';
import 'package:preferences/preferences.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

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
  if (currentInfo != null && timeToShowNotifications()) {
    if (currentInfo[1]) {
      if (currentInfo[3]){
        if (PrefService.getBool(Constants.prefFirstCacheNotification) ?? true) {
          PrefService.setBool(Constants.prefFirstCacheNotification, false);
          NotificationManager.show(
            title: 'Nueva Información!',
            body: 'Los datos del parte diario se han actualizado. '
                'Póngase al día. Toque para revisar.',
            id: Constants.infoUpdateNotification,
          );
        }
      }
      else{
        if (PrefService.getBool(Constants.prefFirstModificationNotification) ?? true) {
          PrefService.setBool(Constants.prefFirstModificationNotification, false);
          NotificationManager.show(
            title: 'Cambios Realizados!',
            body: 'Los datos se han actualizado. '
                'Hemos mejorado los datos dispoibles. Toque para revisar.',
            id: Constants.infoUpdateNotification,
          );
        }
      }
    }
    if (currentInfo[0] && currentInfo[2]) {
      if (PrefService.getBool(Constants.prefFirstVersionNotification) ?? true) {
        PrefService.setBool(Constants.prefFirstVersionNotification, false);
        NotificationManager.show(
          title: 'Actualización!',
          body: 'Covid19 Cuba Data posee una nueva versión. '
              'No te pierdas las nuevas características.',
          id: Constants.appUpdateNotification,
        );
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
        'Ya casi son las 9 de la noche. Súmate a los aplausos por quienes trabajan por la salud y seguridad de todos. \n' +
            claps +
            claps,
  );
}

bool timeToShowNotifications() {
  DateTime moment = DateTime.now();
  return moment.hour < Constants.startSilentIime &&
      moment.hour > Constants.endSilentTime;
}

bool clapsTime() {
  DateTime date = DateTime.now();

  return date.hour >= Constants.startClapsHour &&
      date.minute >= Constants.startClapsMinute &&
      date.hour <= Constants.stopClapsHour;
}
