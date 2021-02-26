import 'package:bgg_api/src/model/forum.dart';
import 'package:bgg_api/src/xml/thread_decoder.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class ForumDecoder extends XmlDecoder<Forum> {
  const ForumDecoder();

  final ThreadDecoder threadDecoder = const ThreadDecoder();

  @override
  Forum decode(XmlNode xml) {
    return Forum(
      id: readId(xml),
      groupId: readIntAttribute(xml, 'groupid'),
      title: readStringAttribute(xml, 'title'),
      description: readStringAttribute(xml, 'description'),
      numThreads: readIntAttribute(xml, 'numthreads'),
      numPosts: readIntAttribute(xml, 'numposts'),
      lastPostDate: readStringAttribute(xml, 'lastpostdate'),
      threads: findElements(getElement(xml, 'threads'), 'thread')
          .map((e) => threadDecoder.decode(e))
          .toList(),
    );
  }
}
