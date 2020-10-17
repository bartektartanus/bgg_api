import 'package:bgg_api/src/xml/thread_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode thread from xml', () {
    final xml = '''
        <thread id="1144462" subject="First playthrough of a real gem!!?" author="16 Ft Pauly" numarticles="4" postdate="Mon, 24 Mar 2014 15:50:34 +0000" lastpostdate="Wed, 26 Mar 2014 05:02:07 +0000"/>''';
    final document = XmlDocument.parse(xml);
    final decoder = ThreadDecoder();
    var thread = decoder.decode(document.rootElement);

    expect(thread.id, equals(1144462));
    expect(thread.subject, equals('First playthrough of a real gem!!?'));
    expect(thread.author, equals('16 Ft Pauly'));
    expect(thread.numArticles, equals(4));
    expect(thread.postDate, equals('Mon, 24 Mar 2014 15:50:34 +0000'));
    expect(thread.lastPostDate, equals('Wed, 26 Mar 2014 05:02:07 +0000'));
  });
}