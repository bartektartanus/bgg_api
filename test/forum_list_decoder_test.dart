import 'package:bgg_api/src/xml/forum_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode forum without threads from xml', () {
    final xml = '''
        <forum id="1439902" groupid="0" title="Sessions" noposting="0" description="Post your session reports here." numthreads="10" numposts="75" lastpostdate="Tue, 20 Nov 2018 16:31:41 +0000"/>''';
    final document = XmlDocument.parse(xml);
    final decoder = ForumDecoder();
    var forum = decoder.decode(document.rootElement);

    expect(forum.id, equals(1439902));
    expect(forum.groupId, equals(0));
    expect(forum.title, equals('Sessions'));
    expect(forum.description, equals('Post your session reports here.'));
    expect(forum.numThreads, equals(10));
    expect(forum.numPosts, equals(75));
    expect(forum.lastPostDate, equals('Tue, 20 Nov 2018 16:31:41 +0000'));
  });

  test('should decode forum with threads from xml', () {
    final xml = '''
        <forum id="1439902" title="Sessions" numthreads="10" numposts="75" lastpostdate="Thu, 01 Jan 1970 00:00:00 +0000" noposting="0" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
          <threads>
            <thread id="2097581" subject="The Splendor meta-game" author="rkonigsberg" numarticles="5" postdate="Sat, 17 Nov 2018 21:37:43 +0000" lastpostdate="Tue, 20 Nov 2018 16:31:41 +0000"/>
            <thread id="2093208" subject="The Office finds the gem trade splendid" author="pdzoch" numarticles="5" postdate="Sat, 10 Nov 2018 23:34:08 +0000" lastpostdate="Tue, 13 Nov 2018 03:27:13 +0000"/>
            <thread id="1495976" subject="As tight as it comes" author="Wraith" numarticles="8" postdate="Mon, 28 Dec 2015 03:58:50 +0000" lastpostdate="Sat, 02 Jan 2016 16:38:50 +0000"/>
          </threads>
        </forum>''';
    final document = XmlDocument.parse(xml);
    final decoder = ForumDecoder();
    var forum = decoder.decode(document.rootElement);

    expect(forum.id, equals(1439902));
    expect(forum.groupId, equals(null));
    expect(forum.title, equals('Sessions'));
    expect(forum.description, equals(null));
    expect(forum.numThreads, equals(10));
    expect(forum.numPosts, equals(75));
    expect(forum.lastPostDate, equals('Thu, 01 Jan 1970 00:00:00 +0000'));
    expect(forum.threads.length, equals(3));
  });
}
