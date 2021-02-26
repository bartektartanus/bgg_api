import 'dart:async';

import 'package:http/http.dart';
import 'package:xml/xml.dart';

/// A lightweight HTTP shim that is simple to implement.
///
/// Most users should directly use the high-level `Bgg` class.
class BggHttp {
  static final Uri _defaultBaseUri =
      Uri(scheme: 'https', host: 'www.boardgamegeek.com', path: 'xmlapi2');

  final Client _http;
  final Uri _baseUri;

  BggHttp({Client? http, Uri? baseUri})
      : _http = http ?? Client(),
        _baseUri = baseUri ?? _defaultBaseUri;

  Future<XmlDocument> get(Iterable<String> pathSegments,
      {Map<String, dynamic> queryParameters =
          const <String, dynamic>{}}) async {
    var response = await _http.get(_baseUri.replace(
        pathSegments: _baseUri.pathSegments.toList()..addAll(pathSegments),
        queryParameters: queryParameters));
    return XmlDocument.parse(response.body);
  }

  /// Closes the HTTP client, terminating all connections.
  void close() => _http.close();
}
