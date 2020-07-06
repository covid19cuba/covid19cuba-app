// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:getflutter/getflutter.dart';

class NotificationSettings extends StatefulWidget {
  @override
  State<NotificationSettings> createState() => NotificationSettingsState();
}

class NotificationSettingsState extends State<NotificationSettings> {
  int startHour = 0;
  int endHour = 0;
  int startMinute = 0;
  int endMinute = 0;
  bool doNotDisturbEnabled;

  static const divider = const Divider(
    thickness: 1,
    indent: 16,
    endIndent: 16,
  );

  NotificationSettingsState() {
    this.startHour =
        PrefService.getInt(Constants.prefDoNotDisturbTimeStartHour) ?? 21;
    this.startMinute =
        PrefService.getInt(Constants.prefDoNotDisturbTimeStartMinutes) ?? 30;
    this.endHour =
        PrefService.getInt(Constants.prefDoNotDisturbTimeEndHour) ?? 9;
    this.endMinute =
        PrefService.getInt(Constants.prefDoNotDisturbTimeEndMinutes) ?? 30;
    this.doNotDisturbEnabled =
        PrefService.getBool(Constants.prefDoNotDisturbTime) ?? false;
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Notificaciones'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          PreferenceTitle(
            'Habilitar Notificaciones',
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SwitchPreference(
            'Cambios en los datos',
            Constants.prefInfoUpdateNotifications,
            desc:
                'Notificar de modificaciones con respecto a los datos. No incluye el parte diario.',
          ),
          SwitchPreference(
            'Parte Diario',
            Constants.prefDailyUpdateNotifications,
            desc: 'Notificar de la actualización del parte diario.',
          ),
          SwitchPreference(
            'Aplausos Diaros',
            Constants.prefClapsNotifications,
            desc: 'Recordatorio diario de la hora de los aplausos.',
          ),
          divider,
          PreferenceTitle(
            'Tiempo sin notificaciones',
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SwitchPreference(
            'Habilitar Notificaciones silenciosas',
            Constants.prefDoNotDisturbTime,
            desc: 'Notificaciones silencionsas por un rango de tiempo',
            onChange: updateDoNotDisturbTime,
          ),
          GFListTile(
            titleText: "Tiempo de Inicio",
            description: Text("$startHour:${timeRep(startMinute)}"),
            icon: GFButton(
              text: "Cambiar",
              onPressed: doNotDisturbEnabled ? () => showDialog(context: contex) :null,
              color: Constants.primaryColor,
              disabledColor: Color.fromRGBO(147, 147, 147, 1),
            ),
          ),
          GFListTile(
            titleText: "Tiempo de Finalización",
            description: Text("$endHour:${timeRep(endMinute)}"),
            icon: GFButton(
              text: "Cambiar",
              onPressed: doNotDisturbEnabled ? () => showDialog(context: contex, start: false) :null,
              color: Constants.primaryColor,
              disabledColor: Color.fromRGBO(147, 147, 147, 1),
            ),
          ),
        ],
      ),
    );
  }

  void showDialog({@required BuildContext context, bool start = true}) {
    DateTime now = DateTime.now();
    showTimePicker(
      context: context,
      initialTime:
      TimeOfDay(hour: start ? startHour : endHour, minute: start ? startMinute : endMinute),
    ).then((TimeOfDay value) {
      if (value != null) {
        saveOptions(value, start: start);
      }
    });
  }

  void updateDoNotDisturbTime() {
    setState(() {
      this.doNotDisturbEnabled =
          PrefService.getBool(Constants.prefDoNotDisturbTime) ?? false;
    });
  }

  Future<void> saveOptions(TimeOfDay value, {bool start = true}) async {
    int hour = value.hour;
    int minutes = value.minute;

    await PrefService.setInt(
        start
            ? Constants.prefDoNotDisturbTimeStartHour
            : Constants.prefDoNotDisturbTimeEndHour,
        hour);
    await PrefService.setInt(
        start
            ? Constants.prefDoNotDisturbTimeStartMinutes
            : Constants.prefDoNotDisturbTimeEndMinutes,
        minutes);

    setState(() {
      if (start) {
        startHour = hour;
        startMinute = minutes;
      } else {
        endHour = hour;
        endMinute = minutes;
      }
    });
  }
}

String timeRep(int value){
  if(value > 9){
    return value.toString();
  }
  return "0$value";
}