import 'package:meta/meta.dart';

class Family {
  final int id;
  final String name;
  final String description;

  const Family({
    @required this.id,
    @required this.name,
    this.description,
  });

  @override
  String toString() {
    return 'Family{id: $id, name: $name, description: $description}';
  }
}
