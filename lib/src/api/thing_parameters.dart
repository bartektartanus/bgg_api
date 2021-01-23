import 'package:bgg_api/src/api/query_parameters.dart';

import 'thing_type.dart';

class ThingParameters extends QueryParameters {
  ///	Specifies the id of the thing(s) to retrieve. To request multiple things with a single query, NNN can specify
  /// a comma-delimited list of ids.
  final List<int> id;

  /// Specifies that, regardless of the type of thing asked for by id, the results are filtered by the THINGTYPE(s)
  /// specified. Multiple THINGTYPEs can be specified in a comma-delimited list.
  final List<ThingType> type;

  /// Returns version info for the item.
  final bool versions;

  /// Returns videos for the item.
  final bool videos;

  /// Returns ranking and rating stats for the item.
  final bool stats;

  /// Returns historical data over time. See page parameter.
  final bool historical;

  /// Returns marketplace data.
  final bool marketplace;

  /// Returns all comments about the item. Also includes ratings when commented. See page parameter.
  final bool comments;

  /// Returns all ratings for the item. Also includes comments when rated. See page parameter. The ratingcomments
  /// and comments parameters cannot be used together, as the output always appears in the <comments> node of the XML;
  /// comments parameter takes precedence if both are specified. Ratings are sorted in descending rating value, based on
  /// the highest rating they have assigned to that item (each item in the collection can have a different rating).
  final bool ratingComments;

  ThingParameters({
    this.id = const [],
    this.type = const [],
    this.versions = false,
    this.videos = false,
    this.stats = false,
    this.historical = false,
    this.marketplace = false,
    this.comments = false,
    this.ratingComments = false,
  });

  @override
  Map<String, dynamic> toMap() {
    var map = {
      'id': id.map((e) => e.toString()).join(','),
      'type': type.map((e) => e.name()).join(',')
    };
    if (versions) {
      map.putIfAbsent('versions', () => '1');
    }
    if (videos) {
      map.putIfAbsent('videos', () => '1');
    }
    if (stats) {
      map.putIfAbsent('stats', () => '1');
    }
    if (historical) {
      map.putIfAbsent('historical', () => '1');
    }
    if (marketplace) {
      map.putIfAbsent('marketplace', () => '1');
    }
    if (comments) {
      map.putIfAbsent('comments', () => '1');
    }
    if (ratingComments) {
      map.putIfAbsent('ratingcomments', () => '1');
    }
    return map;
  }
}
