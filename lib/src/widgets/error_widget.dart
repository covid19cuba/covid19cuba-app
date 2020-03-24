import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';

class ErrorWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorWidget({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(30),
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 150,
          ),
        ),
        Text(
          'Ha ocurrido un error',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              errorMessage,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: GFButton(
            text: 'Intentar actualizar la información',
            textColor: Colors.white,
            color: Colors.white,
            size: GFSize.LARGE,
            shape: GFButtonShape.pills,
            type: GFButtonType.outline2x,
            fullWidthButton: true,
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: GFButton(
            text: 'Ver última información obtenida',
            textColor: Colors.white,
            color: Colors.white,
            size: GFSize.LARGE,
            shape: GFButtonShape.pills,
            type: GFButtonType.outline2x,
            fullWidthButton: true,
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent());
            },
          ),
        ),
      ],
    );
  }
}
