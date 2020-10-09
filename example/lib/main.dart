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
