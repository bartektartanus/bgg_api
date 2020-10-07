import 'dart:async';

import 'package:xml/xml.dart';

import 'http.dart';
import 'model/board_game.dart';
import 'model/board_game_ref.dart';
import 'xml/board_game_decoder.dart';
import 'xml/board_game_ref_decoder.dart';

/// A client for [BGG's API ver 2](https://boardgamegeek.com/wiki/page/BGG_XML_API2).
class Bgg {
  final BggHttp _http;

  Bgg({BggHttp http}) : _http = http ?? new BggHttp();

  /// Retrieve information about a particular game by [gameId].
  Future<BoardGame> getBoardGame(int gameId) async {
    final xml = (await _http.get([
      'thing',
      '$gameId',
    ], queryParameters: <String, dynamic>{
      'id': '$gameId'
    }))
        .rootElement
        .children
        .firstWhere((e) => e.nodeType == XmlNodeType.ELEMENT);
    return const BoardGameDecoder().decode(xml);
  }

  /// Retrieves a list of board games matching [query].
  Future<Iterable<BoardGameRef>> searchBoardGames(String query) async {
    final xml = (await _http.get([
      'search',
    ], queryParameters: <String, dynamic>{
      'query': query,
    }))
        .rootElement
        .children
        .where((e) => e.nodeType == XmlNodeType.ELEMENT);
    return xml.map((e) => const BoardGameRefDecoder().decode(e));
  }
}
