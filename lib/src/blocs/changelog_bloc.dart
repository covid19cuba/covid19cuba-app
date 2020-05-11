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

export 'events/events.dart';
export 'states/states.dart';

class ChangelogBloc extends Bloc<ChangelogEvent, ChangelogState> {
  @override
  ChangelogState get initialState => InitialChangelogState();

  @override
  Stream<ChangelogState> mapEventToState(ChangelogEvent event) async* {
    if (event is FetchChangelogEvent) {
      yield LoadingChangelogState();
      try {
        var data = await getChangelogData();
        yield LoadedChangelogState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on ParseException catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: e.toString(),
        );
      }
    }
    if (event is RefreshChangelogEvent) {
      try {
        var data = await getChangelogData();
        yield LoadedChangelogState(data: data);
      } on BadRequestException catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on SocketException catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: 'No se ha podido establecer conexión. Por favor, '
              'revise su conexión y vuelva a intentarlo.',
        );
      } on ParseException catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: 'Hay problema con los servidores. Por favor, '
              'espere unos minutos y vuelva a intentarlo.',
        );
      } catch (e) {
        log(e.toString());
        yield ErrorChangelogState(
          errorMessage: e.toString(),
        );
      }
    }
  }
}
