// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/utils/utils.dart';

class BulletinsBloc extends Bloc<BulletinsEvent, BulletinsState> {
  @override
  BulletinsState get initialState => InitialBulletinsState();

  @override
  Stream<BulletinsState> mapEventToState(BulletinsEvent event) async* {
    if (event is FetchBulletinsEvent) {
      yield LoadingBulletinsState();
      try {
        var provider = BulletinsProvider();
        var data = await provider.getDataOrCache();
        yield LoadedBulletinsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on ParseException catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: e.toString(),
        );
      }
    }
    if (event is RefreshBulletinsEvent) {
      try {
        var provider = BulletinsProvider();
        var data = await provider.getDataOrCache();
        yield LoadedBulletinsState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on ParseException catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorBulletinsState(
          errorMessage: e.toString(),
        );
      }
    }
  }
}
