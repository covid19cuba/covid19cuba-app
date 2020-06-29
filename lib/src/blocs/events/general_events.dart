// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

abstract class GeneralEvent {
  const GeneralEvent();
}

class FetchGeneralEvent extends GeneralEvent {
  final bool showNotification;
  final bool useCache;

  const FetchGeneralEvent({
    this.showNotification = false,
    this.useCache = false,
  });
}

class RefreshGeneralEvent extends GeneralEvent {
  const RefreshGeneralEvent();
}
