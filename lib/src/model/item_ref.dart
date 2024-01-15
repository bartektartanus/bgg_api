class ItemRef {
  final int? id;
  final String? name;

  ItemRef({
    this.id,
    this.name,
  });

  @override
  String toString() {
    return 'ItemRef{id: $id, name: $name}';
  }
}
