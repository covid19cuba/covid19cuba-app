// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

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

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';

class BulletinsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BulletinsPageState();
}

class BulletinsPageState extends State<BulletinsPage> {
  Completer<void> refreshCompleter;

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return BlocProvider(
        create: (context) => BulletinsBlock(),
        child: BlocListener<BulletinsBlock, BulletinsState>(
          listener: (context, state) {
            if (state is LoadedBulletinsState) {
              refreshCompleter?.complete();
              refreshCompleter = Completer();
            }
          },
          child: BlocBuilder<BulletinsBlock, BulletinsState>(
            builder: (context, state) {
              return Scaffold(
                appBar: getAppBar(context, state),
                body: getBody(context, state),
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

  Widget getAppBar(BuildContext context, BulletinsState state) {
    return AppBar(
      centerTitle: true,
      title: Text('Boletines'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: ()  {
            BlocProvider.of<BulletinsBlock>(context).add(
              FetchBulletinsEvent(),
            );
//         var provider = BulletinsProvider();
//         print(await provider.getDataOrCache());

          },
        ),
      ],
    );
  }

  Widget getBody(BuildContext context, BulletinsState state) {
    if (state is InitialBulletinsState) {
      BlocProvider.of<BulletinsBlock>(context).add(
        RefreshBulletinsEvent(),
      );
    }
    if (state is LoadingBulletinsState) {
      return LoadingWidget();
    }
    if (state is LoadedBulletinsState) {
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<BulletinsBlock>(context).add(
              RefreshBulletinsEvent(),
            );
            return refreshCompleter.future;
          },
          child: ListView(
            children: loadBulletins(state.data),
            //children: state.data.changelog.reversed.map((item) {

          ),
        ),
      );
    }
    if (state is ErrorBulletinsState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        onPressed: () {
          BlocProvider.of<BulletinsBlock>(context).add(FetchBulletinsEvent());
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

List<Widget> loadBulletins(Bulletins sources) {
  var result = [];
  for (var prov in sources.providers) {
    for (var bulletin in prov.bulletins){
      result.add(
        GFCard(
          boxFit: BoxFit.cover,
          image: Image.asset('your asset image'),
          title: GFListTile(
              title: Text('Card Title'),
              icon: GFIconButton(
                onPressed: null,
                icon: Icon(Icons.favorite_border),
              )
          ),
          content: Text("Some quick example text to build on the card"),
          buttonBar: GFButtonBar(
            children: <Widget>[
              GFButton(
                onPressed: () {},
                text: 'Read More',
              ),
            ],
          ),
        )
      );
    }
  }

  result.add(Text("probando"));

  return result;
}

void sourcePresentation(BulletinProvider provider, List<dynamic> view) {
  var head = GFListTile(
    titleText: provider.name,
  );

  view.add(head);

  for (var bull in provider.bulletins) {
    view.add(
      GFListTile(
        titleText: "No. ${bull.id} ${bull.info}",
        description: Text("Tamaño en MB: ${bull.size}"),
      ),
    );
  }
}
