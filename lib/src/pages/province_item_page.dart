import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;
import 'package:covid19cuba/src/widgets/widgets.dart';

class ProvinceItemPage extends StatefulWidget {
  final String province;

  ProvinceItemPage({this.province}) : assert(province != null);

  @override
  State<StatefulWidget> createState() {
    return ProvinceItemPageState(
      province: province,
    );
  }
}

class ProvinceItemPageState extends State<ProvinceItemPage>
    with TickerProviderStateMixin {
  final String province;

  Completer<void> refreshCompleter;
  AnimationController fadeController;
  Animation<double> fadeAnimation;

  ProvinceItemPageState({this.province}) : assert(province != null);

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    fadeAnimation = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      return BlocProvider(
        create: (context) => ProvinceBloc(),
        child: BlocListener<ProvinceBloc, ProvinceState>(
          listener: (context, state) {
            if (state is LoadedProvinceState) {
              refreshCompleter?.complete();
              refreshCompleter = Completer();
            }
          },
          child: BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return Scaffold(
                appBar: getAppBar(context, state),
                body: FadeTransition(
                  opacity: fadeAnimation,
                  child: getBody(context, state),
                ),
              );
            },
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      return getError();
    }
  }

  Widget getAppBar(BuildContext context, ProvinceState state) {
    return AppBar(
      centerTitle: true,
      title: Text(Constants.provinceAbbreviations[province]),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<ProvinceBloc>(context).add(
              FetchProvinceEvent(
                province: province,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget getBody(BuildContext context, ProvinceState state) {
    fadeController.reset();
    fadeController.forward();
    if (state is InitialProvinceState) {
      BlocProvider.of<ProvinceBloc>(context).add(
        RefreshProvinceEvent(
          province: province,
        ),
      );
    }
    if (state is LoadingProvinceState) {
      return LoadingWidget();
    }
    if (state is LoadedProvinceState) {
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<ProvinceBloc>(context).add(
              RefreshProvinceEvent(province: province),
            );
            return refreshCompleter.future;
          },
          child: ProvinceWidget(data: state.data),
        ),
      );
    }
    if (state is ErrorProvinceState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<ProvinceBloc>(context).add(FetchProvinceEvent(
            province: province,
          ));
        },
        onPressedCache: () {},
        cache: false,
      );
    }
    return Container();
  }

  Widget getError() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
      ),
      drawer: HomeDrawerWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: Icon(
              Icons.error_outline,
              color: Constants.primaryColor,
              size: 150,
            ),
          ),
          Text(
            'Ha ocurrido un error',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'El equipo de desarrollo de la aplicación le pide disculpas '
                'y le invita al grupo de Telegram para que reporte el '
                'problema y así poder solucionarlo ayudando a los restantes '
                'usuarios. Gracias de antemano.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: GFButton(
              text: 'Grupo de soporte en Telegram',
              textColor: Constants.primaryColor,
              color: Constants.primaryColor,
              size: GFSize.LARGE,
              shape: GFButtonShape.pills,
              type: GFButtonType.outline2x,
              fullWidthButton: true,
              onPressed: () async {
                const url = 'https://t.me/covid19cubadatachat';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  log('Could not launch $url');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
