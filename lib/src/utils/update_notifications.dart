import 'package:covid19cuba/src/utils/utils.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'dart:developer';

void appTask(String taskId, [bool headless = false]) async {
  InfoUpdate current_info = await isInfoUpdated();
  if (current_info != null) {
    if (current_info.needUpdate) {
      if (headless) {
        await NotificationManager.initialize();
      }
      NotificationManager.show(
        title: 'Nueva información !!!!',
        body: 'Los datos se han actualizado, póngase al día.',
        id: 0,
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
