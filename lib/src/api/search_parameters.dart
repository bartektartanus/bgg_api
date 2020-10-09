import 'package:bgg_api/src/api/query_parameters.dart';
import 'package:bgg_api/src/api/thing_type.dart';

class SearchParameters extends QueryParameters {
  final String query;
  final List<ThingType> type;
  final bool exact;

  SearchParameters(this.query, this.type, this.exact);

  @override
  Map<String, dynamic> toMap() {
    var map = {'query': query, 'type': type.map((e) => e.name()).join(',')};
    if(exact){
      map.putIfAbsent('exact', () => '1');
    }
    return map;
  }
}
