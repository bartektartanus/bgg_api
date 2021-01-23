import 'package:bgg_api/src/api/query_parameters.dart';

class ForumParameters extends QueryParameters {
  ///	Specifies the id of the forum. This is the id that appears in the address of the page when visiting a forum in the browser.
  final int id;

  /// The page of the thread list to return; page size is 50. Threads in the thread list are sorted in order of most recent post.
  final int page;

  ForumParameters({this.id, this.page});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id.toString(), 'page': page.toString()};
  }
}
