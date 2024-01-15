import 'package:bgg_api/src/api/query_parameters.dart';
import 'package:bgg_api/src/api/thing_type.dart';

class SearchParameters extends QueryParameters {
  /// Returns all types of Items that match SEARCH_QUERY. Spaces in the SEARCH_QUERY are replaced by a +
  final String query;

  /// Return all items that match SEARCH_QUERY of type TYPE. TYPE might be rpgitem, videogame, boardgame,
  /// boardgameaccessory or boardgameexpansion. You can return multiple types by listing them separated by commas,
  /// e.g. type=TYPE1,TYPE2,TYPE3
  final List<ThingType> type;

  /// Limit results to items that match the SEARCH_QUERY exactly
  final bool exact;

  SearchParameters(
      {required this.query, this.type = const [], this.exact = false});

  @override
  Map<String, dynamic> toMap() {
    var map = {'query': query};
    if (type.isNotEmpty) {
      map.putIfAbsent('type', () => type.map((e) => e.name()).join(','));
    }
    if (exact) {
      map.putIfAbsent('exact', () => '1');
    }
    return map;
  }
}
