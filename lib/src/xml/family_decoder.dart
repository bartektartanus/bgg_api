import 'package:bgg_api/src/model/family.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class FamilyDecoder extends XmlDecoder<Family> {
  const FamilyDecoder();

  @override
  Family decode(XmlNode xml) {
    return Family(
      id: readId(xml),
      name: readStringValue(xml, 'name'),
      description: readStringUnescaped(xml, 'description'),
      thumbnail: readUri(xml, 'thumbnail'),
      image: readUri(xml, 'image'),
    );
  }
}
