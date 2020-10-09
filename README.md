# bgg_api

[![pub package](https://img.shields.io/pub/v/bgg_api.svg)](https://pub.dartlang.org/packages/bgg_api) [![Build Status](https://travis-ci.org/bartektartanus/bgg_api.svg?branch=master)](https://travis-ci.org/bartektartanus/bgg_api) [![codecov](https://codecov.io/gh/bartektartanus/bgg_api/branch/master/graph/badge.svg)](https://codecov.io/gh/bartektartanus/bgg_api)


[Board Game Geek][BGG] XML API client (version 2)

This package was inspired by [bgg.dart](https://github.com/matanlurey/bgg.dart) package, which works with first version of BGG API. 

[BGG]: https://boardgamegeek.com

## Usage

```dart
import 'package:bgg_api/bgg_api.dart';

void main() async {
  var bgg = Bgg();
  var boardGame = await bgg.getBoardGame(148228);

  print(boardGame.name); // prints 'Splendor'
  print(boardGame.yearPublished); // prints 2014
  print(boardGame.minPlayers); // prints 2
  print(boardGame.maxPlayers); // prints 4
  
  var searchBoardGamesResult = await bgg.searchBoardGames('catan');
  print(searchBoardGamesResult.length);

}
```