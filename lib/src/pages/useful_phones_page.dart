import 'package:flutter/material.dart';

import 'package:covid19cuba/src/pages/phoneDetailsPage.dart';
import 'package:covid19cuba/src/utils/functions.dart';
import 'package:covid19cuba/src/utils/province.dart';

class UsefulPhonesPage extends StatelessWidget {

  final provinceList = getProvinceList();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atención a la población'),
      ),
      body: Container(  
        child: SingleChildScrollView(
          child: Table(
            children: _getRowsList(context)
          ),
        )
      ),
    );
  }

  List<TableRow> _getRowsList(BuildContext context){
    final List<TableRow> rowsList = new List();
    final String imageRoute = 'assets/images/';

    for(int i = 0; i < provinceList.length; i+=2){
      rowsList.add(
        TableRow(  
          children: [
            _createTableItem(context, provinceList[i]),
            _createTableItem(context, provinceList[i+1])
          ]
        )
      );
    }
    return rowsList;
  }

  Widget _createTableItem(BuildContext context, Province province){
    final tableItem = Hero(
      tag: province.name,
      child:Container( 
        height: 200,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(  
          image: DecorationImage(  
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.darken),
            image: AssetImage(province.image),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Container( 
          child: Center(
            child: _description(province),
          )
        )
      )
    );
    return GestureDetector(
      child: tableItem,
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PhoneDetailsPage(province: province),
          ),
        );
      },
    );
  }

  Widget _description(Province province){
    return Column(
      children: <Widget>[
        SizedBox(height: 35),
        Text(
          province.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16 
          ),
        ),
        SizedBox(height: 15),
        Column(
          children: province.phoneNumbers.map((phoneNumber){
            return Text(
              phoneNumber,
              style: TextStyle(
                color: Colors.white
              )
            );
          }).toList(),
        )
      ],
    );
  }

}