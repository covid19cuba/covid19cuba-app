// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:preferences/preferences.dart';

import 'utils.dart';

/// Sends an HTTP HEAD request with the given headers to the given URL, which
/// can be a [Uri] or a [String].
///
/// This automatically initializes a new [Client] and closes that client once
/// the request is complete. If you're planning on making multiple requests to
/// the same server, you should use a single [Client] for all of those requests.
///
/// For more fine-grained control over the request, use [Request] instead.
Future<Response> head(url, {Map<String, String> headers}) =>
    _withClient((client) => client.head(url, headers: headers));

/// Sends an HTTP GET request with the given headers to the given URL, which can
/// be a [Uri] or a [String].
///
/// This automatically initializes a new [Client] and closes that client once
/// the request is complete. If you're planning on making multiple requests to
/// the same server, you should use a single [Client] for all of those requests.
///
/// For more fine-grained control over the request, use [Request] instead.
Future<Response> get(url, {Map<String, String> headers}) =>
    _withClient((client) => client.get(url, headers: headers));

/// Sends an HTTP POST request with the given headers and body to the given URL,
/// which can be a [Uri] or a [String].
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
///
/// For more fine-grained control over the request, use [Request] or
/// [StreamedRequest] instead.
Future<Response> post(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((client) =>
        client.post(url, headers: headers, body: body, encoding: encoding));

/// Sends an HTTP PUT request with the given headers and body to the given URL,
/// which can be a [Uri] or a [String].
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
///
/// For more fine-grained control over the request, use [Request] or
/// [StreamedRequest] instead.
Future<Response> put(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((client) =>
        client.put(url, headers: headers, body: body, encoding: encoding));

/// Sends an HTTP PATCH request with the given headers and body to the given
/// URL, which can be a [Uri] or a [String].
///
/// [body] sets the body of the request. It can be a [String], a [List<int>] or
/// a [Map<String, String>]. If it's a String, it's encoded using [encoding] and
/// used as the body of the request. The content-type of the request will
/// default to "text/plain".
///
/// If [body] is a List, it's used as a list of bytes for the body of the
/// request.
///
/// If [body] is a Map, it's encoded as form fields using [encoding]. The
/// content-type of the request will be set to
/// `"application/x-www-form-urlencoded"`; this cannot be overridden.
///
/// [encoding] defaults to [utf8].
///
/// For more fine-grained control over the request, use [Request] or
/// [StreamedRequest] instead.
Future<Response> patch(url,
        {Map<String, String> headers, body, Encoding encoding}) =>
    _withClient((client) =>
        client.patch(url, headers: headers, body: body, encoding: encoding));

/// Sends an HTTP DELETE request with the given headers to the given URL, which
/// can be a [Uri] or a [String].
///
/// This automatically initializes a new [Client] and closes that client once
/// the request is complete. If you're planning on making multiple requests to
/// the same server, you should use a single [Client] for all of those requests.
///
/// For more fine-grained control over the request, use [Request] instead.
Future<Response> delete(url, {Map<String, String> headers}) =>
    _withClient((client) => client.delete(url, headers: headers));

/// Sends an HTTP GET request with the given headers to the given URL, which can
/// be a [Uri] or a [String], and returns a Future that completes to the body of
/// the response as a [String].
///
/// The Future will emit a [ClientException] if the response doesn't have a
/// success status code.
///
/// This automatically initializes a new [Client] and closes that client once
/// the request is complete. If you're planning on making multiple requests to
/// the same server, you should use a single [Client] for all of those requests.
///
/// For more fine-grained control over the request and response, use [Request]
/// instead.
Future<String> read(url, {Map<String, String> headers}) =>
    _withClient((client) => client.read(url, headers: headers));

/// Sends an HTTP GET request with the given headers to the given URL, which can
/// be a [Uri] or a [String], and returns a Future that completes to the body of
/// the response as a list of bytes.
///
/// The Future will emit a [ClientException] if the response doesn't have a
/// success status code.
///
/// This automatically initializes a new [Client] and closes that client once
/// the request is complete. If you're planning on making multiple requests to
/// the same server, you should use a single [Client] for all of those requests.
///
/// For more fine-grained control over the request and response, use [Request]
/// instead.
Future<Uint8List> readBytes(url, {Map<String, String> headers}) =>
    _withClient((client) => client.readBytes(url, headers: headers));

Future<T> _withClient<T>(Future<T> Function(Client) fn) async {
  HttpClient httpClient = new HttpClient();

  bool insecure =
      PrefService.getBool(Constants.prefProxyAllowInsecureCertificates) ??
          false;

  if (insecure) {
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  }

  bool proxy = PrefService.getBool(Constants.prefProxy) ?? false;

  if (proxy) {
    String host = PrefService.getString(Constants.prefProxyHost);
    int port = int.parse(PrefService.getString(Constants.prefProxyPort));
    httpClient.findProxy = (uri) {
      return "PROXY $host:$port";
    };
    bool proxyCredentials = PrefService.getBool(Constants.prefProxyCredentials);
    if (proxyCredentials) {
      String username =
          PrefService.getString(Constants.prefProxyCredentialsName);
      String password =
          PrefService.getString(Constants.prefProxyCredentialsPassword) ?? '';
      httpClient.addProxyCredentials(
        host,
        port,
        '',
        HttpClientBasicCredentials(username, password),
      );
    }
  }
  IOClient client = IOClient(httpClient);
  try {
    return await fn(client);
  } finally {
    client.close();
  }
}
