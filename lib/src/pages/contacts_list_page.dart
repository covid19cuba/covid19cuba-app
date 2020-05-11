import 'package:covid19cuba/src/utils/constants.dart';
import 'package:covid19cuba/src/utils/contact.dart';
import 'package:flutter/material.dart';

class ContactsListPage extends StatefulWidget {
  @override
  _ContactsListPageState createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {

  List<Contact> contactsList = [
    new Contact(name: 'Daniel', date: DateTime.now().toString(), place: 'Trabajo'),
    new Contact(name: 'Alfredo', date: DateTime.now().toString(), place: 'Tienda'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text('Contactos Registrados'),
      ),
      body: _getList(),
    );
  }

  Widget _getList(){

    return ListView.builder( 
      itemCount: contactsList.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile( 
          title: Text(contactsList[index].name),
          subtitle: Text('${contactsList[index].date} en ${contactsList[index].place}'),
          leading: Icon(
            Icons.account_circle,
            color: Constants.primaryColor,
          ),
        );
      },
    );
  }
}