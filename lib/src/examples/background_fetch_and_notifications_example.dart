import 'package:covid19cuba/src/utils/utils.dart';
import 'package:background_fetch/background_fetch.dart';

// This task is executed almost every minimumFetchInterval minutes
void regularTask(String taskId) async {
  // code here
  NotificationManager.initialize();
  if (taskId == 'cata.cuba.covid19'){
    NotificationManager.show(title: 'CustomTask', body: 'scheduled from set up function, only works while app is running');
  }
  else{
    // default behavior this will be triggered each taskmanaguer interval minutes
  }
  // Is important to call finish before function return to avoid OS app punishments
  BackgroundFetch.finish(taskId);
}

// This task is executed almost every minimumFetchInterval minutes when the apps not running
void headlessTask(String taskId) async {
  // code here

  if (taskId == 'headless.data.cuba.covid19'){
    //shows a notification
    NotificationManager.initialize();
    NotificationManager.show(title: 'Headless Hello', body: 'Called from a headless custom task');
  }
  else{
    //schedules a custom headless task to a minute in te future
    TaskManaguer.scheduleHeadlessCustomTask(60000, 'headless.data.cuba.covid19');
  }
  // Is important to call finish before function return to avoid OS app punishments
  BackgroundFetch.finish(taskId);
}

void setUp(){
  // initializes the task managuer with a default interval af 15 minutes and with ragularTask function as callback
  TaskManaguer.initialize(15, regularTask);

  // schedules a task with id 'cata.cuba.covid19' that will be tirggered in about 10000 milliseconds (10 seconds)
  TaskManaguer.scheduleInAppCustomTask(10000, 'data.cuba.covid19');


  // this method should be called after main app call, sets the callback function during headless operation
  //(the time interval is the same than before (15 minutes in this example))
  TaskManaguer.setHeadlessTask(headlessTask);
}