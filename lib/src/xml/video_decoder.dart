import 'package:bgg_api/src/model/video.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class VideoDecoder extends XmlDecoder<Video> {
  const VideoDecoder();

  @override
  Video decode(XmlNode xml) {
    return Video(
      id: readIntAttribute(xml, 'id'),
      title: readStringAttribute(xml, 'title'),
      category: readStringAttribute(xml, 'category'),
      language: readStringAttribute(xml, 'language'),
      link: readStringAttribute(xml, 'link'),
      username: readStringAttribute(xml, 'username'),
      userId: readIntAttribute(xml, 'userid'),
      postDate: readStringAttribute(xml, 'postdate'),
    );
  }
}
