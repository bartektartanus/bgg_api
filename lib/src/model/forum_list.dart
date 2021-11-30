import 'forum.dart';

class ForumList {
  final int id;
  final List<Forum> forums;

  ForumList({required this.id, this.forums = const []});
}
