import 'package:bgg_api/bgg_api.dart';
import 'package:bgg_api/src/api/family_parameters.dart';
import 'package:bgg_api/src/api/family_type.dart';
import 'package:bgg_api/src/api/forum_list_parameters.dart';
import 'package:bgg_api/src/api/forum_list_type.dart';
import 'package:bgg_api/src/api/forum_parameters.dart';
import 'package:test/test.dart';

void main() {
  group('api client', () {
    test('should search board games by name', () async {
      var bgg = Bgg();
      expect(await bgg.searchBoardGames('list miłosny'), hasLength(greaterThan(0)));
      expect(await bgg.searchBoardGames('catan'), hasLength(greaterThan(0)));
      expect(await bgg.searchBoardGames('splendor'), hasLength(greaterThan(0)));
      expect(await bgg.searchBoardGames('saboteur'), hasLength(greaterThan(0)));
    });

    test("should contain query in every board game's name", () async {
      var bgg = Bgg();
      var searchGames = await bgg.searchBoardGames('list miłosny');
      expect(searchGames, hasLength(greaterThan(0)));
      expect(searchGames.every((e) => e.name!.toLowerCase().contains('list miłosny')), isTrue);
    });

    test('should find board game by id', () async {
      var bgg = Bgg();
      var boardGame = (await bgg.getBoardGame(148228))!;
      expect(boardGame.name, equals('Splendor'));
      expect(boardGame.yearPublished, equals(2014));
      expect(boardGame.minPlayers, equals(2));
      expect(boardGame.maxPlayers, equals(4));
      expect(boardGame.minPlayTime, equals(30));
      expect(boardGame.minPlayTime, equals(30));
      expect(boardGame.playingTime, equals(30));
      expect(boardGame.minAge, equals(10));
      expect(boardGame.description, startsWith('Splendor is a game of chip-collecting'));
      expect(boardGame.thumbnail.toString(), startsWith('https://cf.geekdo-images.com/'));
      expect(boardGame.thumbnail.toString(), contains('thumb'));
      expect(boardGame.image.toString(), startsWith('https://cf.geekdo-images.com/'));
      expect(boardGame.image.toString(), contains('original'));
    });

    test('should find family by id', () async {
      final bgg = Bgg();
      final familyItems = await bgg.getFamilyItems(FamilyParameters(id: [55], type: [FamilyType.boardgamefamily]));
      expect(familyItems.length, equals(1));

      final familyItem = familyItems[0];
      expect(familyItem.name, equals('Game: Wings of Glory'));
      expect(familyItem.description, equals("Wings of War is a series of games designed by Andrea Angiolino & Pier Giorgio Paglia that merges card and board game mechanics to recreate aerial combat.\n\n"));
      expect(familyItem.thumbnail.toString(), startsWith('https://cf.geekdo-images.com/'));
      expect(familyItem.image.toString(), startsWith('https://cf.geekdo-images.com/'));
    });

    test('should find board game expansion by id', () async {
      var bgg = Bgg();
      var boardGame = (await bgg.getBoardGame(2807))!;
      expect(boardGame.name, equals('Catan: 5-6 Player Extension'));
      expect(boardGame.yearPublished, equals(1996));
      expect(boardGame.minPlayers, equals(5));
      expect(boardGame.maxPlayers, equals(6));
      expect(boardGame.minPlayTime, equals(120));
      expect(boardGame.minPlayTime, equals(120));
      expect(boardGame.playingTime, equals(120));
      expect(boardGame.minAge, equals(10));
      expect(boardGame.description, startsWith('Allows you to add up to two more opponents to The Settlers of Catan.'));
    });

    test('should find forum by id', () async {
      var bgg = Bgg();
      var forum = await bgg.getForum(ForumParameters(id: 1439902));
      expect(forum.id, equals(1439902));
      expect(forum.title, equals('Sessions'));
      expect(forum.threads.length, greaterThanOrEqualTo(10));
      expect(forum.numPosts, greaterThanOrEqualTo(75));
      expect(forum.numThreads, greaterThanOrEqualTo(10));
    });

    test('should find forum list by id', () async {
      var bgg = Bgg();
      var forumList = await bgg.getForumList(ForumListParameters(id: 148228, type: ForumListType.thing));
      expect(forumList.length, equals(10));
    });
  });
}
