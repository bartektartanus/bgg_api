import 'package:xml/xml.dart';

import '../model/board_game.dart';
import 'decoder.dart';

class BoardGameDecoder extends XmlDecoder<BoardGame> {
  const BoardGameDecoder();

  @override
  BoardGame decode(XmlElement xml) {
    return BoardGame(
      id: readId(xml),
      name: readStringValue(xml, 'name'),
      description: readStringUnescaped(xml, 'description'),
      yearPublished: readIntValue(xml, 'yearpublished'),
      minPlayers: readIntValue(xml, 'minplayers'),
      maxPlayers: readIntValue(xml, 'maxplayers'),
      playingTime: readIntValue(xml, 'playingtime'),
      minPlayTime: readIntValue(xml, 'minplaytime'),
      maxPlayTime: readIntValue(xml, 'maxplaytime'),
      minAge: readIntValue(xml, 'minage'),
      thumbnail: Uri.parse(readString(xml, 'thumbnail')),
      image: Uri.parse(readString(xml, 'image')),
    );
  }
}
