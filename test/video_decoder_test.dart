import 'package:bgg_api/src/xml/video_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode video from xml', () {
    final xml = '''
        <video id="278104" title="Splendor - Board Game Chap" category="review" language="English" link="http://www.youtube.com/watch?v=fN-YOWF3InA" username="Eggersontheroof" userid="2636259" postdate="2020-08-20T02:46:38-05:00"/>''';
    final document = XmlDocument.parse(xml);
    final decoder = VideoDecoder();
    var video = decoder.decode(document.rootElement);

    expect(video.id, equals(278104));
    expect(video.title, equals('Splendor - Board Game Chap'));
    expect(video.category, equals('review'));
    expect(video.language, equals('English'));
    expect(video.username, equals('Eggersontheroof'));
    expect(video.userId, equals(2636259));
    expect(video.link, equals('http://www.youtube.com/watch?v=fN-YOWF3InA'));
    expect(video.postDate, equals('2020-08-20T02:46:38-05:00'));
  });
}
