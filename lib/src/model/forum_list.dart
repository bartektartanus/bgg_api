import 'forum.dart';

class ForumList {
  int id;
  List<Forum> forums;

  ForumList({required this.id, this.forums = const []});
}
