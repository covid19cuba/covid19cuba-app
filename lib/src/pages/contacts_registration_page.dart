import 'package:covid19cuba/src/pages/contacts_list_page.dart';
import 'package:flutter/material.dart';

import 'package:covid19cuba/src/utils/constants.dart';
import 'package:covid19cuba/src/utils/contact.dart';

class ContactsRegistrationPage extends StatefulWidget {
  @override
  _ContactsRegistrationPageState createState() => _ContactsRegistrationPageState();
}

class _ContactsRegistrationPageState extends State<ContactsRegistrationPage> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        actions: <Widget>[
          IconButton( 
            icon: Icon(Icons.account_box),
            color: Colors.white,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(  
                  builder: (context) => ContactsListPage()
          )
        );
            },
          ),
        ],
        backgroundColor: Constants.primaryColor,
        title: Container(
          child: Text(
            'Registro de Contacto',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            )),
        ),
      ),
      body: SingleChildScrollView( 
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _nameField(),
                Divider(),
                _dateField(context),
                Divider(),
                _placeField(),
                Divider(height: 50),
                _saveButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField(){

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Nombre',
        suffixIcon: Icon(
          Icons.accessibility_new,
          color: Constants.primaryColor,
          ),
        icon: Icon(
          Icons.account_circle,
          color: Constants.primaryColor,
          )
      ),
      validator: (value){
        return value.length == 0 
        ? 'Debe rellenar este campo antes de guardar'
        : null;
      },
      onSaved: (name){

      },
    );
  }

  Widget _dateField(BuildContext context){

    return TextFormField( 
      enableInteractiveSelection: false,
      decoration: InputDecoration(  
        border: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Fecha cuando tuvo contacto',
        helperText: 'Si se deja en blanco se guardará la fecha actual',
        suffixIcon: Icon(
          Icons.perm_contact_calendar,
          color: Constants.primaryColor,
          ),
        icon: Icon(
          Icons.calendar_today,
          color: Constants.primaryColor,
          ),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      onSaved: (date){
        
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime datePicked = await showDatePicker(  
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime.now(),
      locale: Locale('es', 'ES')
    );

    if(datePicked != null){
      setState(() {
        
      });
    }
  }

  Widget _placeField(){

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        labelText: 'Lugar',
        suffixIcon: Icon(
          Icons.edit_location,
          color: Constants.primaryColor,
          ),
        icon: Icon(
          Icons.add_location,
          color: Constants.primaryColor,
          )
      ),
      
      onSaved: (place){
        
      },
    );
  }

  Widget _saveButton(){

    return RaisedButton.icon( 
      shape: RoundedRectangleBorder(  
        borderRadius: BorderRadius.circular(20.0)
      ),
      color: Constants.primaryColor,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _saveContact,
    );
  }

  void _saveContact(){

    if ( !formKey.currentState.validate() ) return;
    
  }
}