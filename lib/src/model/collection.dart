class Collection {
  final List<CollectionItem> items;

  Collection({required this.items});
}

class CollectionItem {
  final String? objectType;
  final int? objectId;
  final String? subtype;
  final int? collId;
  final String? name;
  final String? originalName;
  final int? yearPublished;
  final Uri? image;
  final Uri? thumbnail;
  final int? numPlays;

  CollectionItem(
      {this.objectType,
      this.objectId,
      this.subtype,
      this.collId,
      this.name,
      this.originalName,
      this.yearPublished,
      this.image,
      this.thumbnail,
      this.numPlays});
}
