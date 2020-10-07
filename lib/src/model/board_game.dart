import 'package:meta/meta.dart';

@immutable
class BoardGame {
  final int id;
  final String name;
  final String description;
  final int yearPublished;
  final int minPlayers;
  final int maxPlayers;
  final int playingTime;
  final int minPlayTime;
  final int maxPlayTime;
  final int minAge;
  final Uri thumbnail;
  final Uri image;

  const BoardGame({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.yearPublished,
    @required this.minPlayers,
    @required this.maxPlayers,
    @required this.playingTime,
    @required this.minPlayTime,
    @required this.maxPlayTime,
    @required this.minAge,
    @required this.thumbnail,
    @required this.image,
  });

  @override
  String toString() {
    return 'BoardGame{id: $id, name: $name, yearPublished: $yearPublished, minPlayers: $minPlayers, maxPlayers: $maxPlayers, playingTime: $playingTime, minPlayTime: $minPlayTime, maxPlayTime: $maxPlayTime, minAge: $minAge, description: $description, thumbnail: $thumbnail, image: $image}';
  }
}
