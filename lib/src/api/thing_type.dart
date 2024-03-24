enum ThingType {
  boardgame,
  boardgameexpansion,
  boardgameaccessory,
  videogame,
  rpgitem,
  rpgissue
}

extension ThingTypeName on ThingType {
  String name() {
    return toString().split('.').last;
  }
}
