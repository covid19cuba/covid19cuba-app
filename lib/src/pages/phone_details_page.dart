// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class PhoneDetailsPage extends StatelessWidget {
  final Province province;

  PhoneDetailsPage({@required this.province});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('${province.name}'),
        backgroundColor: Constants.primaryColor,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Hero(
            tag: province.name,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Constants.primaryColor),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: _getButtons(province),
          ),
        ],
      ),
    );
  }

  Widget _getButtons(Province province) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: province.phoneNumbers.map((phoneNumber) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: GFButton(
              text: phoneNumber,
              textColor: Colors.white,
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              color: Colors.transparent,
              shape: GFButtonShape.pills,
              type: GFButtonType.outline2x,
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.white,
              ),
              fullWidthButton: true,
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              onPressed: () {
                getUrl('tel:' + phoneNumber);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
