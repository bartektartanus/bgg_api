import 'package:bgg_api/src/model/generic_ref.dart';
import 'package:bgg_api/src/model/video.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class GenericDecoder extends XmlDecoder<Generic> {
  const GenericDecoder();

  @override
  Generic decode(XmlNode xml) => Generic(
        id: readIntAttribute(xml, 'id'),
        value: readStringAttribute(xml, 'value'),
        type: readStringAttribute(xml, 'type'),
      );
}
