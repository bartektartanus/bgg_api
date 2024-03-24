import 'package:xml/xml.dart';

import '../model/collection.dart';
import 'decoder.dart';

class CollectionDecoder extends XmlDecoder<Collection> {
  const CollectionDecoder();

  final CollectionItemDecoder collectionItemDecoder =
      const CollectionItemDecoder();

  @override
  Collection decode(XmlNode xml) {
    return Collection(
      items: findElements(xml, 'item')
          .map((e) => collectionItemDecoder.decode(e))
          .toList(),
    );
  }
}

class CollectionItemDecoder extends XmlDecoder<CollectionItem> {
  const CollectionItemDecoder();

  @override
  CollectionItem decode(XmlNode xml) {
    return CollectionItem(
        objectType: readStringAttribute(xml, 'objectype'),
        objectId: readIntAttribute(xml, 'objectid'),
        subtype: readStringAttribute(xml, 'subtype'),
        collId: readIntAttribute(xml, 'collid'),
        name: readString(xml, 'name'),
        originalName: readString(xml, 'originalname'),
        yearPublished: readInt(xml, 'yearpublished'),
        image: readUri(xml, 'image'),
        thumbnail: readUri(xml, 'thumbnail'),
        numPlays: readInt(xml, 'numplays'));
  }
}
