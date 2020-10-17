import 'package:bgg_api/src/api/query_parameters.dart';

import 'forum_list_type.dart';

class ForumListParameters extends QueryParameters {
  ///	Specifies the id of the forum. This is the id that appears in the address of the page when visiting a forum in the browser.
  final int id;

  /// The page of the thread list to return; page size is 50. Threads in the thread list are sorted in order of most recent post.
  final ForumListType type;

  ForumListParameters({this.id, this.type});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id.toString(), 'type': type.name()};
  }
}
