// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'dart:io';

import 'package:covid19cuba/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/utils/utils.dart';

export 'events/events.dart';
export 'states/states.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  @override
  NewsState get initialState => InitialNewsState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNewsEvent) {
      yield LoadingNewsState();
      try {
        NewsModel data;
        try {
          data = await getNewsData();
        } catch (e) {
          data = await getNewsDataFromCache();
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
        setNewsDataToCache(data);
        yield LoadedNewsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
    if (event is FetchNewsEvent) {
      yield LoadingNewsState();
      try {
        var data = await getNewsData();
        yield LoadedNewsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
    if (event is RefreshNewsEvent) {
      try {
        var data = await getNewsData();
        yield LoadedNewsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getNewsDataFromCache();
        yield ErrorNewsState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
  }
}
