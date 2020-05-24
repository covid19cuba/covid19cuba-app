import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';

import 'package:covid19cuba/src/utils/functions.dart';
import 'package:covid19cuba/src/utils/province.dart';


class PhoneDetailsPage extends StatelessWidget {

  final Province province;

  PhoneDetailsPage({@required this.province});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${province.name}'),
      ),
      body: Hero(
        tag: province.name,
        child: Container( 
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(  
            image: DecorationImage(  
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
              image: AssetImage(province.image),
              fit: BoxFit.cover
            )
          ),
          child: _getButtons(province)
        ),
      ),
    );
  }

  Widget _getButtons(Province province){
    return Center( 
      child: Column(  
        children: <Widget>[
          SizedBox(height: 440),
          Column(
            children: province.phoneNumbers.map((phoneNumber){
              return SizedBox(
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: GFButton(
                    type: GFButtonType.outline,
                    shape: GFButtonShape.pills,
                    borderShape: Border.all(color: Colors.white.withOpacity(0.4)),
                    fullWidthButton: true,
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    text: phoneNumber,
                    textColor: Colors.white,
                    onPressed: (){
                      getUrl('tel:' + phoneNumber);
                    },
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}