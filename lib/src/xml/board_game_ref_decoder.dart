import 'package:xml/xml.dart';

import '../model/board_game_ref.dart';
import 'decoder.dart';

class BoardGameRefDecoder extends XmlDecoder<BoardGameRef> {
  const BoardGameRefDecoder();

  @override
  BoardGameRef decode(XmlElement xml) {
    return BoardGameRef(
        id: readId(xml), name: readStringValue(xml, 'name'), yearPublished: readIntValue(xml, 'yearpublished'));
  }
}
