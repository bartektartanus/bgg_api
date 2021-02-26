class Family {
  final int? id;
  final String? name;
  final String? description;

  const Family({
    this.id,
    this.name,
    this.description,
  });

  @override
  String toString() {
    return 'Family{id: $id, name: $name, description: $description}';
  }
}
