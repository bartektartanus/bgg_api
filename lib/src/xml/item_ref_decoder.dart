import 'package:bgg_api/src/model/item_ref.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class ItemRefDecoder extends XmlDecoder<ItemRef> {
  const ItemRefDecoder();

  @override
  ItemRef decode(XmlElement xml) {
    return ItemRef(id: readId(xml), name: readStringValue(xml, 'name'));
  }
}
