import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/blocs.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:covid19cuba/src/widgets/error_widget.dart' as ew;
import 'package:covid19cuba/src/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<void> refreshCompleter;

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is LoadedHomeState) {
            refreshCompleter?.complete();
            refreshCompleter = Completer();
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: getAppBar(context, state),
              drawer: getHomeDrawer(context, state),
              body: getBody(context, state),
            );
          },
        ),
      ),
    );
  }

  Widget getAppBar(BuildContext context, HomeState state) {
    return AppBar(
      centerTitle: true,
      title: Text(Constants.appName),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(FetchHomeEvent());
            log('onPressed refresh button');
          },
        ),
      ],
    );
  }

  Widget getHomeDrawer(BuildContext context, HomeState state) {
    return HomeDrawerWidget();
  }

  Widget getBody(BuildContext context, HomeState state) {
    if (state is InitialHomeState) {
      BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent());
    }
    if (state is LoadingHomeState) {
      return LoadingWidget();
    }
    if (state is LoadedHomeState) {
      return Container(
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<HomeBloc>(context).add(
              RefreshHomeEvent(),
            );
            return refreshCompleter.future;
          },
          child: HomeWidget(
            data: state.data,
            countries: state.countries,
            config: state.config,
          ),
        ),
      );
    }
    if (state is ErrorHomeState) {
      return ew.ErrorWidget(
        errorMessage: state.errorMessage,
        cache: state.cache,
      );
    }
    return Container();
  }
}
