import 'dart:async';

import 'package:bgg_api/src/api/query_parameters.dart';
import 'package:bgg_api/src/api/search_parameters.dart';
import 'package:bgg_api/src/api/thing_parameters.dart';
import 'package:bgg_api/src/api/thing_type.dart';
import 'package:bgg_api/src/model/item_ref.dart';
import 'package:xml/xml.dart';

import 'http.dart';
import 'model/board_game.dart';
import 'model/board_game_ref.dart';
import 'xml/board_game_decoder.dart';
import 'xml/board_game_ref_decoder.dart';
import 'xml/decoder.dart';
import 'xml/item_ref_decoder.dart';

/// A client for [BGG's API ver 2](https://boardgamegeek.com/wiki/page/BGG_XML_API2).
class Bgg {
  final BggHttp _http;

  Bgg({BggHttp http}) : _http = http ?? BggHttp();

  /// Retrieve information about a particular board game by [gameId].
  Future<BoardGame> getBoardGame(int gameId) async {
    return _getFirst(['thing'], const BoardGameDecoder(), ThingParameters(id: gameId, type: [ThingType.boardgame]));
  }

  /// Retrieve information about a particular thing.
  Future<BoardGame> getThing(ThingParameters parameters) async {
    return _getFirst(['thing'], const BoardGameDecoder(), parameters);
  }

  /// Retrieves a list of board games (only) matching [query].
  Future<Iterable<BoardGameRef>> searchBoardGames(String query) async {
    return _getAll(['search'], const BoardGameRefDecoder(), SearchParameters(query, [ThingType.boardgame], false));
  }

  /// Retrieves a list of all things matching [query].
  Future<Iterable<ItemRef>> searchThings(SearchParameters parameters) async {
    return _getAll(['search'], const ItemRefDecoder(), parameters);
  }

  Future<T> _getFirst<T>(List<String> path, XmlDecoder<T> decoder, QueryParameters parameters) async {
    final xml = (await _http.get(path, queryParameters: parameters.toMap()))
        .rootElement
        .children
        .firstWhere((e) => e.nodeType == XmlNodeType.ELEMENT);
    return decoder.decode(xml);
  }

  Future<List<T>> _getAll<T>(List<String> path, XmlDecoder<T> decoder, QueryParameters parameters) async {
    final xml = (await _http.get(path, queryParameters: parameters.toMap()))
        .rootElement
        .children
        .where((e) => e.nodeType == XmlNodeType.ELEMENT);
    return xml.map((e) => decoder.decode(e)).toList();
  }
}
