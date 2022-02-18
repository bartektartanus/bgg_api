import 'package:bgg_api/src/xml/collection_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode board game from xml', () {
    final xml = '''
        <items totalitems="2" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse" pubdate="Fri, 18 Feb 2022 09:58:56 +0000">
          <item objecttype="thing" objectid="432" subtype="boardgame" collid="73107756">
            <name sortindex="1">6. bierze!</name>
            <originalname>6 nimmt!</originalname>
            <yearpublished>2013</yearpublished>
            <image>
            https://cf.geekdo-images.com/bf3Arvu6o6nYZpzY9Y6DjA__original/img/ifAjRKMfIIL8Cr7FQ_0T7QB9zaY=/0x0/filters:format(png)/pic2620412.png
            </image>
            <thumbnail>
            https://cf.geekdo-images.com/bf3Arvu6o6nYZpzY9Y6DjA__thumb/img/EuR0Zq_2cmjzTHqCxmdGMHagluE=/fit-in/200x150/filters:strip_icc()/pic2620412.png
            </thumbnail>
            <status own="1" prevowned="0" fortrade="0" want="0" wanttoplay="0" wanttobuy="0" wishlist="0" preordered="0" lastmodified="2021-02-25 13:49:11"/>
            <numplays>7</numplays>
          </item>
          <item objecttype="thing" objectid="230802" subtype="boardgame" collid="73107768">
            <name sortindex="1">Azul</name>
            <yearpublished>2018</yearpublished>
            <image>
            https://cf.geekdo-images.com/cU73zTExnlgBPcJ8BKjG2w__original/img/Dzu4QICCAFfV2qtOIN7FWgYCG_o=/0x0/filters:format(jpeg)/pic4058722.jpg
            </image>
            <thumbnail>
            https://cf.geekdo-images.com/cU73zTExnlgBPcJ8BKjG2w__thumb/img/d4Nt_5UF5FwVmPCkvGlNxzmJNSk=/fit-in/200x150/filters:strip_icc()/pic4058722.jpg
            </thumbnail>
            <status own="1" prevowned="0" fortrade="0" want="0" wanttoplay="0" wanttobuy="0" wishlist="0" preordered="0" lastmodified="2020-07-29 01:37:34"/>
            <numplays>17</numplays>
          </item>
        </items>''';
    final document = XmlDocument.parse(xml);
    final decoder = CollectionDecoder();
    final collection = decoder.decode(document.rootElement);

    expect(collection.items, hasLength(2));
    final items = collection.items;
    expect(items[0].name, equals('6. bierze!'));
    expect(items[0].yearPublished, equals(2013));
    expect(items[0].numPlays, equals(7));
    expect(items[0].subtype, equals('boardgame'));

    expect(items[1].name, equals('Azul'));
    expect(items[1].yearPublished, equals(2018));
    expect(items[1].numPlays, equals(17));
  });
}
