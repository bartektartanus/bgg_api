import 'thread.dart';

class Forum {
  final int? id;
  final int? groupId;
  final String? title;
  final String? description;
  final int? numThreads;
  final int? numPosts;
  final String? lastPostDate;
  final List<Thread> threads;

  Forum({
    this.id,
    this.groupId,
    this.title,
    this.description,
    this.numThreads,
    this.numPosts,
    this.lastPostDate,
    this.threads = const [],
  });

  @override
  String toString() {
    return 'Forum{id: $id, groupId: $groupId, title: $title, description: $description, numThreads: $numThreads, numPosts: $numPosts, lastPostDate: $lastPostDate, threads: $threads}';
  }
}
