// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'dart:io';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'events/events.dart';
export 'states/states.dart';

typedef DataProvider<T> = Future<T> Function();
typedef DataSaver<T> = void Function(T);

class GeneralBloc<T> extends Bloc<GeneralEvent, GeneralState> {
  final DataProvider<T> getData;
  final DataProvider<T> getDataFromCache;
  final DataSaver<T> setDataToCache;

  static GeneralBloc<NewsModel> getNewsBloc() {
    return GeneralBloc<NewsModel>(
      getData: getNewsData,
      getDataFromCache: getNewsDataFromCache,
      setDataToCache: setNewsDataToCache,
    );
  }

  GeneralBloc({
    @required this.getData,
    @required this.getDataFromCache,
    @required this.setDataToCache,
  })  : assert(getData != null),
        assert(getDataFromCache != null),
        assert(setDataToCache != null);

  @override
  GeneralState get initialState => InitialGeneralState();

  @override
  Stream<GeneralState> mapEventToState(GeneralEvent event) async* {
    if (event is FetchGeneralEvent) {
      yield LoadingGeneralState();
    }
    try {
      T data;
      try {
        data = await getData();
      } catch (e) {
        if (event is FetchGeneralEvent && event.useCache) {
          data = await getDataFromCache();
          if (data == null) {
            throw e;
          } else if (event.showNotification) {
            NotificationManager.show(
              title: 'No se ha podido establecer conexión',
              body: 'Se muestra la última información descargada. '
                  'Por favor, revise su conexión y vuelva a intentarlo.',
            );
          }
        } else {
          throw e;
        }
      }
      setDataToCache(data);
      yield LoadedGeneralState(data: data);
    } catch (e) {
      log(e.toString());
      var data = await getDataFromCache();
      var message = getMessageError(e);
      yield ErrorGeneralState(
        errorMessage: message,
        cache: data != null,
      );
    }
  }

  String getMessageError(Exception e) {
    if (e is BadRequestException) {
      return 'No se ha podido establecer conexión. Por favor, '
          'revise su conexión y vuelva a intentarlo.';
    } else if (e is SocketException) {
      return 'No se ha podido establecer conexión. Por favor, '
          'revise su conexión y vuelva a intentarlo.';
    } else if (e is ParseException) {
      return 'Hay problema con los servidores. Por favor, '
          'espere unos minutos y vuelva a intentarlo.';
    }
    return e.toString();
  }
}
