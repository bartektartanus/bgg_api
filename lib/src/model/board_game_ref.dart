import 'package:meta/meta.dart';

class BoardGameRef {
  final int id;
  final String name;
  final int yearPublished;

  const BoardGameRef({
    @required this.id,
    @required this.name,
    this.yearPublished,
  });

  @override
  String toString() {
    return 'BoardGameRef{id: $id, name: $name, yearPublished: $yearPublished}';
  }
}
