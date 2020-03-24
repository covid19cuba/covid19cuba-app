import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
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
        var data = await getData(); // TODO: Make request to cache for load data
        if (data == null) {
          data = await getData();
        }
        // TODO: Make request to cache for save data
        yield LoadedHomeState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorHomeState(errorMessage: e.toString());
      }
    }
    if (event is FetchHomeEvent) {
      yield LoadingHomeState();
      try {
        var data = await getData();
        // TODO: Make request to cache for save data
        yield LoadedHomeState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorHomeState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorHomeState(errorMessage: e.toString());
      }
    }
  }
}
