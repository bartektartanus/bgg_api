import 'package:meta/meta.dart';

class ItemRef {
  final int id;
  final String name;

  ItemRef({@required this.id, @required this.name});

  @override
  String toString() {
    return 'ItemRef{id: $id, name: $name}';
  }
}
