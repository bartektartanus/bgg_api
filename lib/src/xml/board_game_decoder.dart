import 'package:bgg_api/src/xml/generic_decoder.dart';
import 'package:bgg_api/src/xml/video_decoder.dart';
import 'package:xml/xml.dart';

import '../model/board_game.dart';
import 'decoder.dart';

class BoardGameDecoder extends XmlDecoder<BoardGame> {
  const BoardGameDecoder();

  final VideoDecoder videoDecoder = const VideoDecoder();
  final GenericDecoder genericDecoder = const GenericDecoder();

  @override
  BoardGame decode(XmlNode xml) => BoardGame(
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
        boardGameDesigner: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamedesigner')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameArtist: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgameartist')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGamePublisher: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamepublisher')
            .map((e) => genericDecoder.decode(e))
            .toList(),
      );
}
