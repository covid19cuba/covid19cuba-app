// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:covid19cuba/src/models/contact/contact.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsListPage extends StatefulWidget {
  @override
  ContactsListPageState createState() => ContactsListPageState();
}

class ContactsListPageState extends State<ContactsListPage> {
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contactos Registrados'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (c) {
              return [
                PopupMenuItem(
                  child: Text(
                    'Exportar CSV',
                    style: TextStyle(
                      color: Constants.primaryColor,
                    ),
                  ),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text(
                    'Exportar PDF',
                    style: TextStyle(
                      color: Constants.primaryColor,
                    ),
                  ),
                  value: 1,
                ),
              ];
            },
            onSelected: (index) async {
              var box = await Hive.openBox('contacts');
              var contacts = getContactsList(box);
              File file;
              switch (index) {
                case 0:
                  file = await exportToCsv(contacts);
                  break;
                case 1:
                  file = await exportToPdf(contacts);
                  break;
              }
              if (file != null) {
                /*final snackBar = SnackBar(
                  content: Text(
                    'Se guardo el archivo correctamente en la dirección:\n\n'
                    '${file.path}',
                  ),
                  duration: Duration(seconds: 5),
                );
                Scaffold.of(globalKey.currentContext).showSnackBar(snackBar);*/
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Archivo guardado',
                        style: TextStyle(color: Constants.primaryColor),
                      ),
                      content: Text(
                        'Se guardo el archivo correctamente en la dirección:'
                        '\n\n'
                        '${file.path}',
                        style: TextStyle(color: Constants.primaryColor),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'Continuar',
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
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        child: Icon(Icons.person_add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactsRegistrationPage(),
            ),
          );
        },
      ),
      body: ValueListenableBuilder(
        key: globalKey,
        valueListenable: Hive.box('contacts').listenable(),
        builder: (context, Box box, widget) {
          var contacts = getContactsList(box);
          return getList(contacts);
        },
      ),
    );
  }

  Widget getList(List<Contact> contacts) {
    if (contacts.length == 0) {
      return Center(
        child: Container(
          margin: EdgeInsets.all(60),
          child: Text(
            'No hay contactos registrados',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return ListView.separated(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(contacts[index].name),
          subtitle: Text(
            '${contacts[index].date.toStrPlus()} '
            'en ${contacts[index].place}',
          ),
          leading: Icon(
            Icons.account_circle,
            color: Constants.primaryColor,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactsRegistrationPage(
                  index: contacts[index].index,
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
