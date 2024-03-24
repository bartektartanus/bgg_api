import 'package:bgg_api/src/xml/board_game_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode board game from xml', () {
    // https://boardgamegeek.com/xmlapi2/thing?id=148228
    final xml = '''<item type="boardgame" id="148228">
	<thumbnail>https://cf.geekdo-images.com/thumb/img/D4hkkHfOgu22PwgJomjplWAveuo=/fit-in/200x150/filters:strip_icc()/pic1904079.jpg</thumbnail>
	<image>https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg</image>
	<name type="primary" sortindex="1" value="Splendor"/>
	<name type="alternate" sortindex="1" value="Розкіш"/>
	<name type="alternate" sortindex="1" value="Роскошь"/>
	<name type="alternate" sortindex="1" value="ספלנדור"/>
	<name type="alternate" sortindex="1" value="جواهري"/>
	<name type="alternate" sortindex="1" value="เกมค้าเพชร"/>
	<name type="alternate" sortindex="1" value="宝石の煌き"/>
	<name type="alternate" sortindex="1" value="璀璨宝石"/>
	<name type="alternate" sortindex="1" value="璀璨寶石"/>
	<name type="alternate" sortindex="1" value="스플렌더"/>
	<description>Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops&mdash;all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.&#10;&#10;</description>
	<yearpublished value="2014"/>
	<minplayers value="2"/>
	<maxplayers value="4"/>
	<poll name="suggested_numplayers" title="User Suggested Number of Players" totalvotes="1103">
		<results numplayers="1">
			<result value="Best" numvotes="1"/>
			<result value="Recommended" numvotes="15"/>
			<result value="Not Recommended" numvotes="669"/>
		</results>
		<results numplayers="2">
			<result value="Best" numvotes="346"/>
			<result value="Recommended" numvotes="582"/>
			<result value="Not Recommended" numvotes="78"/>
		</results>
		<results numplayers="3">
			<result value="Best" numvotes="571"/>
			<result value="Recommended" numvotes="399"/>
			<result value="Not Recommended" numvotes="16"/>
		</results>
		<results numplayers="4">
			<result value="Best" numvotes="343"/>
			<result value="Recommended" numvotes="540"/>
			<result value="Not Recommended" numvotes="81"/>
		</results>
		<results numplayers="4+">
			<result value="Best" numvotes="4"/>
			<result value="Recommended" numvotes="27"/>
			<result value="Not Recommended" numvotes="543"/>
		</results>
	</poll>
	<playingtime value="30"/>
	<minplaytime value="30"/>
	<maxplaytime value="30"/>
	<minage value="10"/>
	<poll name="suggested_playerage" title="User Suggested Player Age" totalvotes="310">
		<results>
			<result value="2" numvotes="0"/>
			<result value="3" numvotes="0"/>
			<result value="4" numvotes="7"/>
			<result value="5" numvotes="12"/>
			<result value="6" numvotes="65"/>
			<result value="8" numvotes="154"/>
			<result value="10" numvotes="64"/>
			<result value="12" numvotes="5"/>
			<result value="14" numvotes="1"/>
			<result value="16" numvotes="2"/>
			<result value="18" numvotes="0"/>
			<result value="21 and up" numvotes="0"/>
		</results>
	</poll>
	<poll name="language_dependence" title="Language Dependence" totalvotes="168">
		<results>
			<result level="21" value="No necessary in-game text" numvotes="165"/>
			<result level="22" value="Some necessary text - easily memorized or small crib sheet" numvotes="1"/>
			<result level="23" value="Moderate in-game text - needs crib sheet or paste ups" numvotes="0"/>
			<result level="24" value="Extensive use of text - massive conversion needed to be playable" numvotes="0"/>
			<result level="25" value="Unplayable in another language" numvotes="2"/>
		</results>
	</poll>
	<link type="boardgamecategory" id="1002" value="Card Game"/>
	<link type="boardgamecategory" id="1021" value="Economic"/>
	<link type="boardgamecategory" id="1070" value="Renaissance"/>
	<link type="boardgamemechanic" id="2912" value="Contracts"/>
	<link type="boardgamemechanic" id="2041" value="Open Drafting"/>
	<link type="boardgamemechanic" id="2876" value="Race"/>
	<link type="boardgamemechanic" id="2004" value="Set Collection"/>
	<link type="boardgamefamily" id="77906" value="Category: Dized Tutorial"/>
	<link type="boardgamefamily" id="70360" value="Digital Implementations: Board Game Arena"/>
	<link type="boardgamefamily" id="78432" value="Digital Implementations: Google Play"/>
	<link type="boardgamefamily" id="77349" value="Digital Implementations: Steam"/>
	<link type="boardgamefamily" id="33250" value="Game: Splendor"/>
	<link type="boardgamefamily" id="27646" value="Mechanism: Tableau Building"/>
	<link type="boardgamefamily" id="78198" value="Misc: Watch It Played How To Videos"/>
	<link type="boardgameexpansion" id="178656" value="Brettspiel Adventskalender 2015"/>
	<link type="boardgameexpansion" id="231506" value="Brettspiel Adventskalender 2017"/>
	<link type="boardgameexpansion" id="301333" value="Splendor: 2019 Promo – Shen Wansan and Zhou Ying"/>
	<link type="boardgameexpansion" id="220653" value="Splendor: Cities of Splendor"/>
	<link type="boardgameexpansion" id="233847" value="Splendor: Cities of Splendor Promotional Tile"/>
	<link type="boardgameexpansion" id="279798" value="Splendor: Diane de Poitiers Promo Noble"/>
	<link type="boardgameexpansion" id="289795" value="Splendor: Dice Con 2019 Promo cards – Zhang Qian and Xiang Fei"/>
	<link type="boardgameexpansion" id="234005" value="Splendor: Dice Tower Promo Noble"/>
	<link type="boardgameexpansion" id="234162" value="Splendor: Guillaume Budé Promo Noble"/>
	<link type="boardgameexpansion" id="256783" value="Splendor: Jacques Cartier Promo Noble"/>
	<link type="boardgameexpansion" id="369554" value="Splendor: Nobles and Cities Promo"/>
	<link type="boardgameexpansion" id="178742" value="Splendor: Nobles Promo Tiles"/>
	<link type="boardgameexpansion" id="280452" value="Splendor: Nobles Promo Tiles"/>
	<link type="boardgameexpansion" id="190036" value="Splendor: Special Noble Patron Promo"/>
	<link type="boardgameexpansion" id="261074" value="Splendor: Thomas More Promo Noble"/>
	<link type="boardgameaccessory" id="193709" value="Splendor: AsmOPlay Gold Tokens"/>
	<link type="boardgameaccessory" id="337015" value="Splendor: Chilong and Nuwa Promo Tiles"/>
	<link type="boardgameaccessory" id="292898" value="Splendor: Cities of Splendor – Dice Con 2019 City Promo Tile"/>
	<link type="boardgameaccessory" id="272512" value="Splendor: Cities of Splendor – Splendid Cities Organizer"/>
	<link type="boardgameaccessory" id="346473" value="Splendor: Daiji and the Duke of Zhou Promo Tiles"/>
	<link type="boardgameaccessory" id="309478" value="Splendor: e-Raptor Insert"/>
	<link type="boardgameaccessory" id="337016" value="Splendor: Fuxi and the Yan Emperor Promo Tiles"/>
	<link type="boardgameaccessory" id="321502" value="Splendor: Greater China Tournament Prize Coins"/>
	<link type="boardgameaccessory" id="365990" value="Splendor: Hou Yi and Ji Fa Promo Tiles"/>
	<link type="boardgameaccessory" id="365991" value="Splendor: Jiang Ziya and Di Xin of Shang Promo Tiles"/>
	<link type="boardgameaccessory" id="403081" value="Splendor: LaserLand Acrylic Gems"/>
	<link type="boardgameaccessory" id="306398" value="Splendor: Laserox Gemstone Organizer"/>
	<link type="boardgameaccessory" id="184966" value="Splendor: Playmat"/>
	<link type="boardgameaccessory" id="401530" value="Splendor: Playmaty rubber mat"/>
	<link type="boardgameaccessory" id="268394" value="Splendor: Quick-Start Insert"/>
	<link type="boardgameaccessory" id="281008" value="Splendor: Space Cow Promo"/>
	<link type="boardgameaccessory" id="272769" value="Splendor: Splendid Game Chest"/>
	<link type="boardgameaccessory" id="348653" value="Splendor: The GiftForge Insert"/>
	<link type="boardgameaccessory" id="273589" value="Splendor: Tower Rex Organizer"/>
	<link type="boardgameaccessory" id="185398" value="Splendor: Translucent Gem Tokens"/>
	<link type="boardgameimplementation" id="364073" value="Splendor Duel"/>
	<link type="boardgameimplementation" id="293296" value="Splendor: Marvel"/>
	<link type="boardgameimplementation" id="406291" value="스플렌더: Pokémon (Splendor: Pokémon)"/>
	<link type="boardgamedesigner" id="50969" value="Marc André"/>
	<link type="boardgameartist" id="14878" value="Pascal Quidault"/>
	<link type="boardgamepublisher" id="25842" value="Space Cowboys"/>
	<link type="boardgamepublisher" id="15889" value="Asterion Press"/>
	<link type="boardgamepublisher" id="50230" value="Belleville (Бельвіль)"/>
	<link type="boardgamepublisher" id="43740" value="Board Game VN"/>
	<link type="boardgamepublisher" id="34501" value="Boardgame Space"/>
	<link type="boardgamepublisher" id="7162" value="Brain Games"/>
	<link type="boardgamepublisher" id="9068" value="Broadway Toys LTD"/>
	<link type="boardgamepublisher" id="50696" value="CoolPlay"/>
	<link type="boardgamepublisher" id="6784" value="Enigma (Bergsala Enigma)"/>
	<link type="boardgamepublisher" id="5657" value="Filosofia Éditions"/>
	<link type="boardgamepublisher" id="15605" value="Galápagos Jogos"/>
	<link type="boardgamepublisher" id="8820" value="Gém Klub Kft."/>
	<link type="boardgamepublisher" id="28415" value="GoKids 玩樂小子"/>
	<link type="boardgamepublisher" id="23382" value="HaKubia"/>
	<link type="boardgamepublisher" id="1391" value="Hobby Japan"/>
	<link type="boardgamepublisher" id="32569" value="JD Éditions"/>
	<link type="boardgamepublisher" id="6214" value="Kaissa Chess &amp; Games"/>
	<link type="boardgamepublisher" id="8291" value="Korea Boardgames"/>
	<link type="boardgamepublisher" id="3218" value="Lautapelit.fi"/>
	<link type="boardgamepublisher" id="25203" value="Lex Games"/>
	<link type="boardgamepublisher" id="9325" value="Lifestyle Boardgames Ltd"/>
	<link type="boardgamepublisher" id="5787" value="Morapiaf"/>
	<link type="boardgamepublisher" id="32395" value="NeoTroy Games"/>
	<link type="boardgamepublisher" id="7466" value="Rebel Sp. z o.o."/>
	<link type="boardgamepublisher" id="33998" value="Siam Board Games"/>
	<link type="boardgamepublisher" id="538" value="Z-Man Games"/>
	<videos total="393">
<video id="483572" title="How to Win Splendor - Strategy Tips from the World Series of Board Gaming" category="instructional" language="English" link="http://www.youtube.com/watch?v=lYIdqDcoPiA" username="ChrisCFGeorge" userid="2029481" postdate="2024-02-28T14:29:48-06:00"/>
<video id="474079" title="Огляд від Здвинуті кубики" category="review" language="Ukrainian" link="http://www.youtube.com/watch?v=RONKm-1k7gw" username="punk_rock" userid="2986072" postdate="2024-01-07T05:00:16-06:00"/>
<video id="468585" title="Steg för steg - Splendor" category="session" language="Swedish" link="http://www.youtube.com/watch?v=6EqMmKWf3Cc" username="Bitforbit" userid="2090566" postdate="2023-11-29T07:21:05-06:00"/>
<video id="467623" title="Hướng Dẫn Chơi | Splendor | How to Play" category="instructional" language="Vietnamese" link="http://www.youtube.com/watch?v=L5mXNZSfbMQ" username="kienctn15" userid="1842339" postdate="2023-11-22T06:47:29-06:00"/>
<video id="466671" title="みんなで遊ボードゲームLIVE　SPLENDOR 　宝石の煌き" category="session" language="Japanese" link="http://www.youtube.com/watch?v=D0jLlrVElH4" username="chezpierre2020" userid="3374512" postdate="2023-11-16T02:28:24-06:00"/>
<video id="463584" title="How to Play Splendor | Complete Game Rules in 6 Minutes" category="instructional" language="English" link="http://www.youtube.com/watch?v=6Rk4nKEYrhY" username="GamePointTabletop" userid="3537467" postdate="2023-10-26T11:26:08-05:00"/>
<video id="459525" title="I made Splender compact case" category="other" language="English" link="http://www.youtube.com/watch?v=FZ3HNYQNv4U" username="CoLabo" userid="2757607" postdate="2023-10-02T02:47:01-05:00"/>
<video id="452885" title="Splendor - Board Game Rules - English" category="instructional" language="English" link="http://www.youtube.com/watch?v=LcsAmAuM5zA" username="Spacebase" userid="3221918" postdate="2023-08-22T09:30:48-05:00"/>
<video id="451488" title="Splendor - Spielregeln - deutsch" category="instructional" language="German" link="http://www.youtube.com/watch?v=66dUSjxN8OI" username="Spacebase" userid="3221918" postdate="2023-08-12T16:31:59-05:00"/>
<video id="451234" title="COMO JUGAR *SPLENDOR*" category="instructional" language="Spanish" link="http://www.youtube.com/watch?v=tUWv6wHZnA0" username="Mc_gregor14" userid="2500487" postdate="2023-08-10T17:11:17-05:00"/>
<video id="450932" title="Знакомство с игрой" category="review" language="Russian" link="http://www.youtube.com/watch?v=poadWSIwTjc" username="snowbody" userid="201253" postdate="2023-08-09T02:25:48-05:00"/>
<video id="450359" title="Розпаковка від Кубасик" category="unboxing" language="Ukrainian" link="http://www.youtube.com/watch?v=uGK_m9otDuA" username="punk_rock" userid="2986072" postdate="2023-08-06T08:44:45-05:00"/>
<video id="449840" title="VORGESTELLT: Splendor (Space Cowboys/Asmodee)" category="review" language="German" link="http://www.youtube.com/watch?v=GUQpKLqSGjk" username="Gnislew" userid="196566" postdate="2023-08-03T10:21:47-05:00"/>
<video id="446045" title="Огляд від Бельвіль" category="review" language="Ukrainian" link="http://www.youtube.com/watch?v=O5ja9OaTpIs" username="punk_rock" userid="2986072" postdate="2023-07-13T04:06:28-05:00"/>
<video id="444782" title="How to Play Splendor Board Game" category="instructional" language="Hindi" link="http://www.youtube.com/watch?v=qx42PqG1VP0" username="shahulhameed" userid="2676401" postdate="2023-07-05T02:03:09-05:00"/>
</videos>
</item>''';
    final document = XmlDocument.parse(xml);
    final decoder = BoardGameDecoder();
    var boardGame = decoder.decode(document.rootElement);

    expect(boardGame.id, equals(148228));
    expect(boardGame.name, equals('Splendor'));
    expect(boardGame.yearPublished, equals(2014));
    expect(boardGame.minAge, equals(10));
    expect(boardGame.minPlayers, equals(2));
    expect(boardGame.maxPlayers, equals(4));
    expect(boardGame.minPlayTime, equals(30));
    expect(boardGame.maxPlayTime, equals(30));
    expect(boardGame.playingTime, equals(30));
    expect(
        boardGame.description,
        equals(
            "Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops—all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.\n\n"));
    expect(
        boardGame.thumbnail,
        equals(Uri.parse(
            'https://cf.geekdo-images.com/thumb/img/D4hkkHfOgu22PwgJomjplWAveuo=/fit-in/200x150/filters:strip_icc()/pic1904079.jpg')));
    expect(
        boardGame.image,
        equals(Uri.parse(
            'https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg')));
    expect(boardGame.boardGameDesigner.length, equals(1));
    expect(boardGame.boardGameArtist.length, equals(1));
    expect(boardGame.boardGamePublisher.length, equals(26));
    expect(boardGame.videos.length, equals(15));
    expect(boardGame.videos[0].id, equals(483572));
    expect(
        boardGame.videos[0].title,
        equals(
            'How to Win Splendor - Strategy Tips from the World Series of Board Gaming'));
    expect(
        boardGame.names,
        equals([
          'Splendor',
          'Розкіш',
          'Роскошь',
          'ספלנדור',
          'جواهري',
          'เกมค้าเพชร',
          '宝石の煌き',
          '璀璨宝石',
          '璀璨寶石',
          '스플렌더'
        ]));
  });
}
