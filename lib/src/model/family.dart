class Family {
  final int? id;
  final String? name;
  final String? description;
  final Uri? thumbnail;
  final Uri? image;

  const Family({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.image,
  });

  @override
  String toString() {
    return 'Family{id: $id, name: $name, description: $description, thumbnail: $thumbnail, image: $image}';
  }
}
