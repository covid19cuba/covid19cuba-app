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

class ChangelogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangelogPageState();
}

class ChangelogPageState extends State<ChangelogPage>
    with TickerProviderStateMixin {
  Completer<void> refreshCompleter;
  AnimationController fadeController;
  Animation<double> fadeAnimation;

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
        create: (context) => ChangelogBloc(),
        child: BlocListener<ChangelogBloc, ChangelogState>(
          listener: (context, state) {
            if (state is LoadedChangelogState) {
              refreshCompleter?.complete();
              refreshCompleter = Completer();
            }
          },
          child: BlocBuilder<ChangelogBloc, ChangelogState>(
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

  Widget getAppBar(BuildContext context, ChangelogState state) {
    return AppBar(
      centerTitle: true,
      title: Text('Cambios Realizados'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<ChangelogBloc>(context).add(
              FetchChangelogEvent(),
            );
          },
        ),
      ],
    );
  }

  Widget getBody(BuildContext context, ChangelogState state) {
    fadeController.reset();
    fadeController.forward();
    if (state is InitialChangelogState) {
      BlocProvider.of<ChangelogBloc>(context).add(
        RefreshChangelogEvent(),
      );
    }
    if (state is LoadingChangelogState) {
      return LoadingWidget();
    }
    if (state is LoadedChangelogState) {
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<ChangelogBloc>(context).add(
              RefreshChangelogEvent(),
            );
            return refreshCompleter.future;
          },
          child: ListView(
            children: state.data.changelog.reversed.map((item) {
              var title = Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Versión ${item.version} - ${item.date.toStrPlus()}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              );
              var addedTitle = Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Se agregó:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              );
              var added = Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: item.added.map((x) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '- $x',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Constants.primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
              var changedTitle = Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Se cambió:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              );
              var changed = Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: item.changed.map((x) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '- $x',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Constants.primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
              var fixedTitle = Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Se arregló:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              );
              var fixed = Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: item.fixed.map((x) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '- $x',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Constants.primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
              var deletedTitle = Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  'Se eliminó:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryColor,
                  ),
                ),
              );
              var deleted = Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: item.deleted.map((x) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '- $x',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Constants.primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
              var list = List<Widget>();
              list.add(title);
              if (item.added.length > 0) {
                list.add(addedTitle);
                list.add(added);
              }
              if (item.changed.length > 0) {
                list.add(changedTitle);
                list.add(changed);
              }
              if (item.fixed.length > 0) {
                list.add(fixedTitle);
                list.add(fixed);
              }
              if (item.deleted.length > 0) {
                list.add(deletedTitle);
                list.add(deleted);
              }
              list.add(Container(height: 10));
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list,
              );
            }).toList(),
          ),
        ),
      );
    }
    if (state is ErrorChangelogState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<ChangelogBloc>(context).add(FetchChangelogEvent());
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
