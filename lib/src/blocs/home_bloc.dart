import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

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
        DataModel data;
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
        var countries = await getCountriesDataFromCache();
        if (countries == null) countries = await getCountriesData();
        setCountriesDataToCache(countries);
        yield LoadedHomeState(data: data, countries: countries);
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
        var countries = await getCountriesData();
        setCountriesDataToCache(countries);
        yield LoadedHomeState(data: data, countries: countries);
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
        var countries = await getCountriesData();
        setCountriesDataToCache(countries);
        yield LoadedHomeState(data: data, countries: countries);
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
