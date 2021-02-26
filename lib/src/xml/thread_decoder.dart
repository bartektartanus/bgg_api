import 'package:bgg_api/src/model/thread.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class ThreadDecoder extends XmlDecoder<Thread> {
  const ThreadDecoder();

  @override
  Thread decode(XmlNode xml) {
    return Thread(
      id: readIntAttribute(xml, 'id'),
      subject: readStringAttribute(xml, 'subject'),
      author: readStringAttribute(xml, 'author'),
      numArticles: readIntAttribute(xml, 'numarticles'),
      postDate: readStringAttribute(xml, 'postdate'),
      lastPostDate: readStringAttribute(xml, 'lastpostdate'),
    );
  }
}
