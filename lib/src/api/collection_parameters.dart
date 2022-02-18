import 'package:bgg_api/src/api/query_parameters.dart';

class CollectionParameters extends QueryParameters {
  ///	Name of the user to request the collection for.
  final String username;

  CollectionParameters({required this.username});

  @override
  Map<String, dynamic> toMap() {
    return {'username': username};
  }
}
