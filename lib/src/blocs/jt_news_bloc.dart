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

class JTNewsBloc extends Bloc<JTNewsEvent, JTNewsState> {
  @override
  JTNewsState get initialState => InitialJTNewsState();

  @override
  Stream<JTNewsState> mapEventToState(JTNewsEvent event) async* {
    if (event is LoadJTNewsEvent) {
      yield LoadingJTNewsState();
      try {
        JTNewsModel data;
        try {
          data = await getJTNewsData();
        } catch (e) {
          data = await getJTNewsDataFromCache();
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
        setJTNewsDataToCache(data);
        yield LoadedJTNewsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
    if (event is FetchJTNewsEvent) {
      yield LoadingJTNewsState();
      try {
        var data = await getJTNewsData();
        yield LoadedJTNewsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
    if (event is RefreshJTNewsEvent) {
      try {
        var data = await getJTNewsData();
        yield LoadedJTNewsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on SocketException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
          cache: data != null,
        );
      } on ParseException catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
          cache: data != null,
        );
      } catch (e) {
        log(e.toString());
        var data = await getJTNewsDataFromCache();
        yield ErrorJTNewsState(
          errorMessage: e.toString(),
          cache: data != null,
        );
      }
    }
  }
}
