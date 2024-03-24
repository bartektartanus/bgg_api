class Generic {
  final int? id;
  final String? value;
  final String? type;

  Generic({
    this.id,
    this.value,
    this.type,
  });

  @override
  String toString() {
    return 'Generic{id: $id, name: $value, type: $type}';
  }
}
