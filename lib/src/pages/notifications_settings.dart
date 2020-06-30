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
            desc: 'Notificar de modificaciones con respecto a los datos. No incluye el parte diario.',
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

//          Spacer(flex: 10,),
          GFCard(
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  text: "Inicio",
                  onPressed: () {
                    DateTime now = DateTime.now();
                    showTimePicker(
                      context: contex,
                      initialTime:
                          TimeOfDay(hour: startHour, minute: startMinute),
                    ).then((TimeOfDay value) {
                      if (value != null) {
                        saveOptions(value);
                      }
                    });
                  },
                  color: Constants.primaryColor,
                ),
                GFButton(
                  text: "Fin",
                  onPressed: () {
                    DateTime now = DateTime.now();
                    showTimePicker(
                      context: contex,
                      initialTime: TimeOfDay(hour: endHour, minute: endMinute),
                    ).then((TimeOfDay value) {
                      if (value != null) {
                        saveOptions(value, start: false);
                      }
                    });
                  },
                  color: Constants.primaryColor,
                )
              ],
            ),
            title: GFListTile(
                titleText: "Tiempo de No Molestar",
                description: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text("Hora de Inicio: $startHour"),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Minutos de Inicio: $startMinute"),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Hora de finalización: $endHour"),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Text("Minutos de finalización: $endMinute"),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
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
