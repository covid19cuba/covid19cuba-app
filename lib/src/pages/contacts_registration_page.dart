// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'package:covid19cuba/src/models/contact/contact.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart'
    as contactPicker;

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
  List<String> contactsNames;
  List<String> contactsPlaces;
  DateTime dateTime;

  ContactsRegistrationPageState({this.index}) {
    var box = Hive.box('contacts');
    contactsNames = getContactsList(box).map((x) => x.name).toSet().toList();
    contactsPlaces = getContactsList(box).map((x) => x.place).toSet().toList();
    if (index != -1) {
      var json = box.getAt(index);
      var contact = Contact.fromJson(jsonDecode(json));
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
                          title: Text(
                            'Confirme',
                            style: TextStyle(color: Constants.primaryColor),
                          ),
                          content: Text(
                            'Usted esta seguro o segura que desea '
                            'eliminar el contacto.',
                            style: TextStyle(color: Constants.primaryColor),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                'Si',
                                style: TextStyle(color: Constants.primaryColor),
                              ),
                              onPressed: () async {
                                var box = Hive.box('contacts');
                                await box.deleteAt(index);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                'No',
                                style: TextStyle(color: Constants.primaryColor),
                              ),
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
            : <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.contacts,
                    color: Colors.white,
                  ),
                  onPressed: importContact,
                )
              ],
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
    return SimpleAutocompleteFormField<String>(
      controller: nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Nombre de la persona',
        suffixIcon: Icon(
          Icons.clear,
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Constants.primaryColor,
        ),
      ),
      suggestionsHeight: 120,
      itemBuilder: (context, value) => Container(
        padding: EdgeInsets.all(10),
        child: Text(value),
      ),
      onSearch: (s) async => contactsNames
          .where((x) => x.toLowerCase().contains(s.toLowerCase()))
          .toList(),
      onChanged: (value) => setState(() => nameController.text = value),
      onSaved: (value) => setState(() => nameController.text = value),
      validator: (value) =>
          nameController == null || nameController.text.length == 0
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
        prefixIcon: Icon(
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
    return SimpleAutocompleteFormField<String>(
      controller: placeController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Lugar del contacto',
        suffixIcon: Icon(
          Icons.clear,
        ),
        prefixIcon: Icon(
          Icons.add_location,
          color: Constants.primaryColor,
        ),
      ),
      suggestionsHeight: 120,
      itemBuilder: (context, value) => Container(
        padding: EdgeInsets.all(10),
        child: Text(value),
      ),
      onSearch: (s) async => contactsPlaces
          .where((x) => x.toLowerCase().contains(s.toLowerCase()))
          .toList(),
      onChanged: (value) => setState(() => placeController.text = value),
      onSaved: (value) => setState(() => placeController.text = value),
      validator: (value) =>
          placeController == null || placeController.text.length == 0
              ? 'Debe rellenar este campo antes de guardar'
              : null,
    );
  }

  void saveContact() async {
    if (!formKey.currentState.validate()) {
      return;
    }
    var contact = Contact.create(
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

  void importContact() async {
    final contactPicker.PhoneContact contact =
        await contactPicker.FlutterContactPicker.pickPhoneContact();

    nameController.text = contact.fullName;
  }
}
