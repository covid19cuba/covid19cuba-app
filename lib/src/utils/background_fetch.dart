import 'package:background_fetch/background_fetch.dart';
import 'dart:developer';

Future<void> setAppRunningTasks(int interval, Function callback) async{
  BackgroundFetchConfig config = BackgroundFetchConfig(
    minimumFetchInterval: interval,
      stopOnTerminate: false,
      enableHeadless: false,
      requiresBatteryNotLow: false,
      requiresCharging: false,
      requiresStorageNotLow: false,
      requiresDeviceIdle: false,
      requiredNetworkType: NetworkType.NONE
  );

  BackgroundFetch.configure(config, callback);
}

void exampleTaskReciever(String taskId) async{
  print('Event recieved');
  // is important to call finish before function return to avoid OS app punishments
  BackgroundFetch.finish(taskId);
}

void startBackgroundFetch(){
  BackgroundFetch.start().then((int status) {
    log('[BackgroundFetch] start success: $status');
  }).catchError((e) {
    log('[BackgroundFetch] start FAILURE: $e');
  });
}

void stopBackgroundFetch(){
  BackgroundFetch.stop().then((int status) {
    log('[BackgroundFetch] stop success: $status');
  });
}

// delay in milliseconds
void scheduleTask(int delay, String taskId, bool headless){
  BackgroundFetch.scheduleTask(
      TaskConfig(
          delay: delay,
          taskId: taskId,
          enableHeadless: headless));
}

void setHeadlessTaskReciever(Function callback){
  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(callback);
}