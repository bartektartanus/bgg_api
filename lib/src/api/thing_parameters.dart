import 'package:bgg_api/src/api/query_parameters.dart';

import 'thing_type.dart';

class ThingParameters extends QueryParameters {
  ///	Specifies the id of the thing(s) to retrieve. To request multiple things with a single query, NNN can specify a comma-delimited list of ids.
  final int id;

  /// Specifies that, regardless of the type of thing asked for by id, the results are filtered by the THINGTYPE(s) specified. Multiple THINGTYPEs can be specified in a comma-delimited list.
  final List<ThingType> type;

  ThingParameters({this.id, this.type = const []});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id.toString(), 'type': type.map((e) => e.name()).join(',')};
  }
}
