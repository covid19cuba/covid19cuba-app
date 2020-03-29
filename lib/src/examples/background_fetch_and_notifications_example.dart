import 'package:background_fetch/background_fetch.dart';

import 'package:covid19cuba/src/utils/utils.dart';

// This task is executed almost every minimumFetchInterval minutes
void regularTask(String taskId) async {
  // code here
  NotificationManager.initialize();
  if (taskId == 'data.cuba.covid19') {
    NotificationManager.show(
      title: 'CustomTask',
      body: 'Scheduled from set up function, only works while app is running.',
    );
  } else {
    // Default behavior this will be triggered each task manager interval
    // minutes
  }
  // Is important to call finish before function return to avoid OS app
  // punishments
  BackgroundFetch.finish(taskId);
}

// This task is executed almost every minimumFetchInterval minutes when the
// apps not running
void headlessTask(String taskId) async {
  // Code here

  if (taskId == 'headless.data.cuba.covid19') {
    // Shows a notification
    await NotificationManager.initialize();
    await NotificationManager.show(
      title: 'Headless Hello',
      body: 'Called from a headless custom task',
    );
  } else {
    // Schedules a custom headless task to a minute in te future
    TaskManager.scheduleHeadlessCustomTask(
      60000,
      'headless.data.cuba.covid19',
    );
  }
  // Is important to call finish before function return to avoid OS app
  // punishments
  BackgroundFetch.finish(taskId);
}

void setUp() {
  // Initializes the task manager with a default interval af 15 minutes and
  // with regularTask function as callback
  TaskManager.initialize(15, regularTask);

  // Schedules a task with id 'data.cuba.covid19' that will be triggered in
  // about 10000 milliseconds (10 seconds)
  TaskManager.scheduleInAppCustomTask(10000, 'data.cuba.covid19');

  // This method should be called after main app call, sets the callback
  // function during headless operation (the time interval is the same than
  // before (15 minutes in this example))
  TaskManager.setHeadlessTask(headlessTask);
}
