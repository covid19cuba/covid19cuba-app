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

  @override
  void initState(){
    super.initState();

  }

  NotificationSettingsState() {
    this.startHour = 0;
    this.startMinute = 0;
    this.endHour = 0;
    this.endMinute = 0;
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Notificaciones'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//          Spacer(flex: 10,),
          GFCard(
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  text: "Inicio",
                  onPressed: (){
                    DateTime now = DateTime.now();
                    showTimePicker( context: contex,
                    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),).then((TimeOfDay value) {
                      if (value != null){
                        saveOptions(value);
                      }
                    });
                  },
                  color: Constants.primaryColor,
                ),
                GFButton(
                  text: "Fin",
                  onPressed: (){
                    DateTime now = DateTime.now();
                    showTimePicker( context: contex,
                      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),).then((TimeOfDay value) {
                      if (value != null){
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
              description: Container(padding: EdgeInsets.all(10),
                child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(padding: EdgeInsets.only(top: 20, bottom: 10),child: Text("Hora de Inicio: $startHour"),),
                  Container(padding: EdgeInsets.all(10),child: Text("Minutos de Inicio: $startMinute"),),
                  Container(padding: EdgeInsets.all(10),child: Text("Hora de finalización: $endHour"),),
                  Container(padding: EdgeInsets.only(left: 10, right: 10, top: 10),child: Text("Minutos de finalización: $endMinute"),)
                ],
              ),)
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveOptions(TimeOfDay value, {bool start = true}) async{
    int hour = value.hour;
    int minutes = value.minute;

    await PrefService.setInt(start ? Constants.prefDoNotDisturbTimeStartHour : Constants.prefDoNotDisturbTimeEndHour, hour);
    await PrefService.setInt(start ? Constants.prefDoNotDisturbTimeStartMinutes : Constants.prefDoNotDisturbTimeEndMinutes, minutes);

    setState(() {
      if (start){
        startHour = hour;
        startMinute = minutes;
      }
      else{
        endHour = hour;
        endMinute = minutes;
      }
    });
  }
}

class TimeWidget extends StatefulWidget {
  @override
  State<TimeWidget> createState() => TimeWidgetState();
}

class TimeWidgetState extends State<TimeWidget> {
  final TextEditingController startHour = TextEditingController();
  final TextEditingController endHour = TextEditingController();
  final TextEditingController startMinutes = TextEditingController();
  final TextEditingController endMinutes = TextEditingController();

  TimeWidgetState() {
    startHour.text = "12";
    startMinutes.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          TextField(
            controller: startHour,
            readOnly: true,
          ),
          Text(
            ":",
            style: TextStyle(height: 10),
          ),
          TextField(
            controller: startMinutes,
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
