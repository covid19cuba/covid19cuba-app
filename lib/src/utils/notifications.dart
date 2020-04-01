import 'dart:developer';

import 'package:background_fetch/background_fetch.dart';

import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

void appTask(String taskId, [bool headless = false]) async {
  InfoUpdate currentInfo;
  try {
    currentInfo = await isInfoUpdated();
  } catch (e) {
    log(e.toString());
  }
  if (currentInfo != null) {
    if (currentInfo.needUpdate) {
      if (headless) {
        await NotificationManager.initialize();
      }
      NotificationManager.show(
        title: 'Nueva Información!',
        body: 'Los datos se han actualizado. '
            'Póngase al día. Toque para revisar.',
        id: -1,
      );
    }
  } else {
    log('Null info recieved');
  }
  BackgroundFetch.finish(taskId);
}

void appHeadlessTask(String taskId) async {
  return appTask(taskId, true);
}

Future<void> setUpTasks([int minutes = 15]) async {
  await TaskManager.initialize(minutes, appTask);
  await TaskManager.setHeadlessTask(appHeadlessTask);
}
