import 'package:bgg_api/src/api/query_parameters.dart';

import 'family_type.dart';

class FamilyParameters extends QueryParameters {
  ///	Specifies the id of the family to retrieve. To request multiple families with a single query, NNN can specify
  /// a comma-delimited list of ids.
  final List<int> id;

  /// Specifies that, regardless of the type of family asked for by id, the results are filtered by the FAMILYTPE(s)
  /// specified. Multiple FAMILYTYPEs can be specified in a comma-delimited list.
  final List<FamilyType> type;

  FamilyParameters({this.id = const [], this.type = const []});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id.map((e) => e.toString()).join(','),
      'type': type.map((e) => e.name()).join(',')
    };
  }
}
