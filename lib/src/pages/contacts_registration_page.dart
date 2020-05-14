// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ContactsRegistrationPage extends StatefulWidget {
  final int index;

  const ContactsRegistrationPage({this.index = -1});

  @override
  ContactsRegistrationPageState createState() =>
      ContactsRegistrationPageState(index: index);
}

class ContactsRegistrationPageState extends State<ContactsRegistrationPage> {
  final int index;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final placeController = TextEditingController();
  DateTime dateTime;

  ContactsRegistrationPageState({this.index}) {
    if (index != -1) {
      var box = Hive.box('contacts');
      var json = box.getAt(index);
      var contact = ContactModel.fromJson(jsonDecode(json));
      contact.index = index;
      nameController.text = contact.name;
      dateController.text = contact.date.toStrPlus();
      placeController.text = contact.place;
      dateTime = contact.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${index == -1 ? 'Registrar' : 'Editar'} Contacto'),
        actions: index != -1
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirme'),
                          content: Text(
                            'Usted esta seguro o segura que desea '
                            'eliminar el contacto.',
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Si'),
                              onPressed: () async {
                                var box = Hive.box('contacts');
                                await box.deleteAt(index);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ]
            : [],
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveContact,
        child: Icon(Icons.save, color: Colors.white),
        backgroundColor: Constants.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(height: 30),
                nameField(),
                Container(height: 30),
                dateField(context),
                Container(height: 30),
                placeField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      controller: nameController,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Nombre de la persona',
        suffixIcon: Icon(
          Icons.account_circle,
          color: Constants.primaryColor,
        ),
      ),
      validator: (value) => value.length == 0
          ? 'Debe rellenar este campo antes de guardar'
          : null,
    );
  }

  Widget dateField(BuildContext context) {
    return TextFormField(
      controller: dateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Fecha cuando tuvo el contacto',
        helperText: 'Si se deja en blanco se guardará la fecha actual',
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Constants.primaryColor,
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        selectDate(context);
      },
    );
  }

  void selectDate(BuildContext context) async {
    DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: Locale('es', 'ES'),
    );
    if (datePicked != null) {
      setState(() {
        dateController.text = datePicked.toStrPlus();
        dateTime = datePicked;
      });
    }
  }

  Widget placeField() {
    return TextFormField(
      controller: placeController,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Lugar del contacto',
        suffixIcon: Icon(
          Icons.add_location,
          color: Constants.primaryColor,
        ),
      ),
      validator: (value) => value.length == 0
          ? 'Debe rellenar este campo antes de guardar'
          : null,
    );
  }

  void saveContact() async {
    if (!formKey.currentState.validate()) {
      return;
    }
    var contact = ContactModel.create(
      name: nameController.text,
      date: dateTime ?? DateTime.now(),
      place: placeController.text,
    );
    var json = jsonEncode(contact.toJson());
    var box = Hive.box('contacts');
    if (index == -1) {
      await box.add(json);
    } else {
      await box.putAt(index, json);
    }
    Navigator.pop(context);
  }

}



