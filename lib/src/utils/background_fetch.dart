import 'package:background_fetch/background_fetch.dart';

// This task is executed almost every minimumFetchInterval minutes
void regularTask(String taskId) async {
  // code here

  // Is important to call finish before function return to avoid OS app punishments
  BackgroundFetch.finish(taskId);
}

// This task is executed almost every minimumFetchInterval minutes when the apps not running
void headlessTask(String taskId) async {
  // code here

  // Is important to call finish before function return to avoid OS app punishments
  BackgroundFetch.finish(taskId);
}

class TaskManaguer {
  static BackgroundFetchConfig config;
  static bool isInitialized;
  static bool isRunnig;

  static Future<void> initialize(int minutes, Function regularTask) {
    config = BackgroundFetchConfig(
      minimumFetchInterval: minutes,
      stopOnTerminate: false,
      enableHeadless: true,
      forceAlarmManager: true,
    );
    BackgroundFetch.configure(config, regularTask);
    isInitialized = true;
    isRunnig = true;
  }

  static Future<void> stop() async {
    await BackgroundFetch.stop();
    isRunnig = false;
  }

  static Future<void> restart() async {
    if (isInitialized) {
      await BackgroundFetch.start();
      isRunnig = true;
    }
  }

  static Future<void> setHeadlessTask(Function headlessTask) async {
    await BackgroundFetch.registerHeadlessTask(headlessTask);
  }

  // Delay in milliseconds
  static Future<void> scheduleInAppCustomTask(int delay, String taskId) async {
    await BackgroundFetch.scheduleTask(TaskConfig(
      delay: delay,
      taskId: taskId,
    ));
  }

  // Delay in milliseconds
  static Future<void> scheduleHeadlessCustomTask(
      int delay, String taskId) async {
    await BackgroundFetch.scheduleTask(TaskConfig(
      delay: delay,
      taskId: taskId,
      stopOnTerminate: false,
      enableHeadless: true,
    ));
  }
}
