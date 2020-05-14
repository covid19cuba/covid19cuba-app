// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/pages/pages.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class ContactsListPage extends StatefulWidget {
  @override
  ContactsListPageState createState() => ContactsListPageState();
}

class ContactsListPageState extends State<ContactsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contactos Registrados'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    'Exportar',
                    style: TextStyle(
                      color: Constants.primaryColor,
                    ),
                  ),
                  value: 0,
                ),
              ];
            },
            onSelected: (index) {},
          )
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
        valueListenable: Hive.box('contacts').listenable(),
        builder: (context, Box box, widget) {
          var contacts = List<ContactModel>();
          for (var i = 0; i < box.length; ++i) {
            var json = box.getAt(i);
            var contact = ContactModel.fromJson(jsonDecode(json));
            contact.index = i;
            contacts.add(contact);
          }
          contacts.sort((a, b) {
            var cmp = a.date.compareTo(b.date);
            if (cmp == 0) {
              return a.name.compareTo(b.name);
            }
            return cmp;
          });
          return getList(contacts);
        },
      ),
    );
  }

  Widget getList(List<ContactModel> contacts) {
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



