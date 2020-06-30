// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:developer';
import 'dart:io';

import 'package:covid19cuba/src/blocs/events/events.dart';
import 'package:covid19cuba/src/blocs/states/states.dart';
import 'package:covid19cuba/src/data_providers/data_providers.dart';
import 'package:covid19cuba/src/data_providers/downloads_provider.dart';
import 'package:covid19cuba/src/data_providers/protocols_provider.dart';
import 'package:covid19cuba/src/models/about_us/about_us.dart';
import 'package:covid19cuba/src/models/about_us/about_us_state.dart';
import 'package:covid19cuba/src/models/bulletins/bulletins.dart';
import 'package:covid19cuba/src/models/bulletins/bulletins_state.dart';
import 'package:covid19cuba/src/models/changelog/changelog.dart';
import 'package:covid19cuba/src/models/changelog/changelog_state.dart';
import 'package:covid19cuba/src/models/downloads/downloads.dart';
import 'package:covid19cuba/src/models/downloads/downloads_state.dart';
import 'package:covid19cuba/src/models/faqs/faqs.dart';
import 'package:covid19cuba/src/models/faqs/faqs_state.dart';
import 'package:covid19cuba/src/models/model.dart';
import 'package:covid19cuba/src/models/news/news.dart';
import 'package:covid19cuba/src/models/news/news_state.dart';
import 'package:covid19cuba/src/models/protocols/protocols.dart';
import 'package:covid19cuba/src/models/protocols/protocols_state.dart';
import 'package:covid19cuba/src/models/tips/tips.dart';
import 'package:covid19cuba/src/models/tips/tips_state.dart';
import 'package:covid19cuba/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'events/events.dart';
export 'states/states.dart';

typedef DataFunctionProvider<T> = Future<T> Function();
typedef DataFunctionSaver<T> = void Function(T);

class GeneralBloc<T extends Model, E extends CacheModel>
    extends Bloc<GeneralEvent, GeneralState> {
  final DataProvider<T, E> provider;

  static GeneralBloc<AboutUs, AboutUsState> getAboutUsBloc() {
    return GeneralBloc<AboutUs, AboutUsState>(
      provider: AboutUsProvider(),
    );
  }

  static GeneralBloc<Bulletins, BulletinsState> getBulletinsBloc() {
    return GeneralBloc<Bulletins, BulletinsState>(
      provider: BulletinsProvider(),
    );
  }

  static GeneralBloc<Changelog, ChangelogState> getChangelogBloc() {
    return GeneralBloc<Changelog, ChangelogState>(
      provider: ChangelogProvider(),
    );
  }

  static GeneralBloc<Downloads, DownloadsState> getDownloadsBloc() {
    return GeneralBloc<Downloads, DownloadsState>(
      provider: DownloadsProvider(),
    );
  }

  static GeneralBloc<Faqs, FaqsState> getFaqsBloc() {
    return GeneralBloc<Faqs, FaqsState>(
      provider: FaqsProvider(),
    );
  }

  static GeneralBloc<News, NewsState> getNewsBloc() {
    return GeneralBloc<News, NewsState>(
      provider: NewsProvider(),
    );
  }

  static GeneralBloc<Protocols, ProtocolsState> getProtocolsBloc() {
    return GeneralBloc<Protocols, ProtocolsState>(
      provider: ProtocolsProvider(),
    );
  }

  static GeneralBloc<Tips, TipsState> getTipsBloc() {
    return GeneralBloc<Tips, TipsState>(
      provider: TipsProvider(),
    );
  }

  GeneralBloc({@required this.provider}) : assert(provider != null);

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
        data = await provider.getData();
      } catch (e) {
        if (event is FetchGeneralEvent && event.useCache) {
          data = await provider.getDataFromCache();
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
      provider.setDataToCache(data);
      yield LoadedGeneralState(data: data);
    } catch (e) {
      log(e.toString());
      var data = await provider.getDataFromCache();
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
