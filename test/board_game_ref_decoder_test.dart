import 'package:bgg_api/src/xml/board_game_ref_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode board game ref from xml', () {
    final xml = '''
        <item type="boardgame" id="180974">
          <name type="alternate" value="Wybuchowa Mieszanka"/>
          <yearpublished value="2015"/>
        </item>''';
    final document = XmlDocument.parse(xml);
    final decoder = BoardGameRefDecoder();
    var boardGameRef = decoder.decode(document.rootElement);
    expect(boardGameRef.id, equals(180974));
    expect(boardGameRef.name, equals('Wybuchowa Mieszanka'));
    expect(boardGameRef.yearPublished, equals(2015));
  });

  test('should decode board game ref without year published', () {
    final xml = '''
        <item type="boardgame" id="90100">
          <name type="primary" value="Die Pioniere (fan expansion for The Settlers of Catan)"/>
        </item>''';
    final document = XmlDocument.parse(xml);
    final decoder = BoardGameRefDecoder();
    var boardGameRef = decoder.decode(document.rootElement);
    expect(boardGameRef.id, equals(90100));
    expect(boardGameRef.name, equals('Die Pioniere (fan expansion for The Settlers of Catan)'));
    expect(boardGameRef.yearPublished, equals(null));
  });
}