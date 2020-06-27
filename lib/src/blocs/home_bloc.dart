// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'dart:io';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/charts/data.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'events/events.dart';
export 'states/states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHomeEvent) {
      yield LoadingHomeState();
      try {
        Data data;
        try {
          data = await getCubaData();
        } catch (e) {
          data = await getCubaDataFromCache();
          if (data == null) {
            throw e;
          } else if (event.showNotification) {
            NotificationManager.show(
              title: 'No se ha podido establecer conexión',
              body: 'Se muestra la última información descargada. '
                  'Por favor, revise su conexión y vuelva a intentarlo.',
            );
          }
        }
        setCubaDataToCache(data);
        yield LoadedHomeState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
    if (event is FetchHomeEvent) {
      yield LoadingHomeState();
      try {
        var data = await getCubaData();
        setCubaDataToCache(data);
        yield LoadedHomeState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }

    if (event is RefreshHomeEvent) {
      try {
        var data = await getCubaData();
        setCubaDataToCache(data);
        yield LoadedHomeState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getCubaDataFromCache();
        yield ErrorHomeState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
  }
}
