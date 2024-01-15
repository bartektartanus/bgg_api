import 'package:bgg_api/src/xml/video_decoder.dart';
import 'package:xml/xml.dart';

import '../model/board_game.dart';
import 'decoder.dart';

class BoardGameDecoder extends XmlDecoder<BoardGame> {
  const BoardGameDecoder();

  final VideoDecoder videoDecoder = const VideoDecoder();

  @override
  BoardGame decode(XmlNode xml) {
    return BoardGame(
      id: readId(xml),
      name: readStringValueWithAttribute(xml, 'name', 'type', 'primary'),
      description: readStringUnescaped(xml, 'description'),
      yearPublished: readIntValue(xml, 'yearpublished'),
      minPlayers: readIntValue(xml, 'minplayers'),
      maxPlayers: readIntValue(xml, 'maxplayers'),
      playingTime: readIntValue(xml, 'playingtime'),
      minPlayTime: readIntValue(xml, 'minplaytime'),
      maxPlayTime: readIntValue(xml, 'maxplaytime'),
      minAge: readIntValue(xml, 'minage'),
      thumbnail: readUri(xml, 'thumbnail'),
      image: readUri(xml, 'image'),
      videos: findElements(getElement(xml, 'videos'), 'video')
          .map((e) => videoDecoder.decode(e))
          .toList(),
      names: findElements(xml, 'name')
          .map((e) => e.getAttribute('value'))
          .whereType<String>()
          .toList(),
    );
  }
}
