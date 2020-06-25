// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

abstract class DataResolver<T, E> {
  Future<T> getDataOrCache();

  Future<T> getCache();

  Future<void> setCache(T data);

  E createInstance();
}

class DataFactory<F, T extends DataResolver<F, T>> {
  T data;

  DataFactory();

  Future<F> getData() {
    data.createInstance();
    return data.getDataOrCache();
  }
}
