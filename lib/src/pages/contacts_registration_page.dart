// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ContactsRegistrationPage extends StatefulWidget {
  @override
  ContactsRegistrationPageState createState() =>
      ContactsRegistrationPageState();
}

class ContactsRegistrationPageState extends State<ContactsRegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final placeController = TextEditingController();
  DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registrar Contacto'),
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

  void saveContact() {
    if (!formKey.currentState.validate()) {
      return;
    }
    if (dateController.text == null || dateController.text.isEmpty) {
      dateController.text = DateTime.now().toStrPlus();
      dateTime = DateTime.now();
    }
    var contact = ContactModel.create(
      name: nameController.text,
      date: dateTime,
      place: placeController.text,
    );
    var json = jsonEncode(contact.toJson());
    var contacts =
        PrefService.getStringList(Constants.prefContacts) ?? List<String>();
    contacts.add(json);
    PrefService.setStringList(Constants.prefContacts, contacts);
    Navigator.pop(context);
  }

}



