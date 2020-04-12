import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/utils/utils.dart';

export 'events/events.dart';
export 'states/states.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  @override
  ProvinceState get initialState => InitialProvinceState();

  @override
  Stream<ProvinceState> mapEventToState(ProvinceEvent event) async* {
    if (event is FetchProvinceEvent) {
      yield LoadingProvinceState();
      try {
        var data = await getProvinceData(event.province);
        yield LoadedProvinceState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on ParseException catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: e.toString(),
        );
      }
    }
    if (event is RefreshProvinceEvent) {
      try {
        var data = await getProvinceData(event.province);
        yield LoadedProvinceState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on ParseException catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorProvinceState(
          errorMessage: e.toString(),
        );
      }
    }
  }
}
