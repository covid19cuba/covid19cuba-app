import 'dart:async';
import 'dart:developer';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;
import 'package:covid19cuba/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

typedef WidgetLoaded<T> = Widget Function(BuildContext, LoadedGeneralState<T>);
typedef FunctionLoaded<T> = void Function(BuildContext, LoadedGeneralState<T>);

class PageWidget<T extends Model, E extends CacheModel>
    extends StatelessWidget {
  final WidgetLoaded<T> widgetLoaded;
  final FunctionLoaded<T> functionLoaded;
  final String title;
  final bool isDark;
  final bool showNotification;

  PageWidget(
    this.widgetLoaded, {
    this.functionLoaded,
    this.title,
    this.isDark = false,
    this.showNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    var refreshCompleter = Completer<void>();
    try {
      return BlocConsumer<GeneralBloc<T, E>, GeneralState>(
        listener: (context, state) {
          if (state is LoadedGeneralState) {
            refreshCompleter?.complete();
            refreshCompleter = Completer<void>();
          }
        },
        builder: (context, state) {
          if (title != null)
            return Scaffold(
              appBar: getAppBar(context, state),
              body: getBody(context, state, refreshCompleter),
            );
          return getBody(context, state, refreshCompleter);
        },
      );
    } catch (e) {
      log(e.toString());
      return getError();
    }
  }

  Widget getAppBar(BuildContext context, GeneralState state) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<GeneralBloc<T, E>>(context).add(
              FetchGeneralEvent(),
            );
          },
        ),
      ],
    );
  }

  Widget getBody(
    BuildContext context,
    GeneralState state,
    Completer<void> refreshCompleter,
  ) {
    if (state is InitialGeneralState) {
      BlocProvider.of<GeneralBloc<T, E>>(context).add(
        FetchGeneralEvent(showNotification: showNotification, useCache: true),
      );
    }
    if (state is LoadingGeneralState) {
      return LoadingWidget(isDark: isDark);
    }
    if (state is LoadedGeneralState<T>) {
      if (functionLoaded != null) {
        functionLoaded(context, state);
      }
      return Container(
        decoration: BoxDecoration(
          color: isDark ? Constants.primaryColor : Colors.white,
        ),
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<GeneralBloc<T, E>>(context)
                .add(RefreshGeneralEvent());
            return refreshCompleter.future;
          },
          child: widgetLoaded(context, state),
        ),
      );
    }
    if (state is ErrorGeneralState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<GeneralBloc<T, E>>(context).add(
            FetchGeneralEvent(),
          );
        },
        onPressedCache: () {
          BlocProvider.of<GeneralBloc<T, E>>(context).add(
            FetchGeneralEvent(useCache: true),
          );
        },
        cache: state.cache,
        isDark: isDark,
      );
    }
    return Container();
  }

  Widget getError() {
    return ListView(
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
    );
  }
}
