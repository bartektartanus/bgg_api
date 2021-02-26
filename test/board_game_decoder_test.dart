import 'package:bgg_api/src/xml/board_game_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode board game from xml', () {
    final xml = '''
        <item type="boardgame" id="148228">
          <thumbnail>https://cf.geekdo-images.com/thumb/img/D4hkkHfOgu22PwgJomjplWAveuo=/fit-in/200x150/filters:strip_icc()/pic1904079.jpg</thumbnail>
          <image>https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg</image>
          <name type="primary" sortindex="1" value="Splendor"/>
          <name type="alternate" sortindex="1" value="Goharneshan (گوهرنشان)"/>
          <name type="alternate" sortindex="1" value="Роскошь"/>
          <description>Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops&mdash;all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.&#10;&#10;</description>
          <yearpublished value="2014"/>
          <minplayers value="2"/>
          <maxplayers value="4"/>
          <poll name="suggested_numplayers" title="User Suggested Number of Players" totalvotes="779">
            <results numplayers="1">
              <result value="Best" numvotes="2"/>
              <result value="Recommended" numvotes="10"/>
              <result value="Not Recommended" numvotes="436"/>
            </results>
            <results numplayers="2">
              <result value="Best" numvotes="241"/>
              <result value="Recommended" numvotes="412"/>
              <result value="Not Recommended" numvotes="52"/>
            </results>
            <results numplayers="3">
              <result value="Best" numvotes="382"/>
              <result value="Recommended" numvotes="298"/>
              <result value="Not Recommended" numvotes="11"/>
            </results>
            <results numplayers="4">
              <result value="Best" numvotes="246"/>
              <result value="Recommended" numvotes="378"/>
              <result value="Not Recommended" numvotes="55"/>
            </results>
            <results numplayers="4+">
              <result value="Best" numvotes="2"/>
              <result value="Recommended" numvotes="19"/>
              <result value="Not Recommended" numvotes="352"/>
            </results>
          </poll>
          <playingtime value="30"/>
          <minplaytime value="30"/>
          <maxplaytime value="30"/>
          <minage value="10"/>
          <poll name="suggested_playerage" title="User Suggested Player Age" totalvotes="207">
            <results>
              <result value="2" numvotes="0"/>
              <result value="3" numvotes="0"/>
              <result value="4" numvotes="3"/>
              <result value="5" numvotes="9"/>
              <result value="6" numvotes="46"/>
              <result value="8" numvotes="97"/>
              <result value="10" numvotes="47"/>
              <result value="12" numvotes="3"/>
              <result value="14" numvotes="1"/>
              <result value="16" numvotes="1"/>
              <result value="18" numvotes="0"/>
              <result value="21 and up" numvotes="0"/>
            </results>
          </poll>
          <poll name="language_dependence" title="Language Dependence" totalvotes="146">
            <results>
              <result level="1" value="No necessary in-game text" numvotes="143"/>
              <result level="2" value="Some necessary text - easily memorized or small crib sheet" numvotes="1"/>
              <result level="3" value="Moderate in-game text - needs crib sheet or paste ups" numvotes="0"/>
              <result level="4" value="Extensive use of text - massive conversion needed to be playable" numvotes="0"/>
              <result level="5" value="Unplayable in another language" numvotes="2"/>
            </results>
          </poll>
          <link type="boardgamecategory" id="1002" value="Card Game"/>
          <link type="boardgamecategory" id="1021" value="Economic"/>
          <link type="boardgamecategory" id="1070" value="Renaissance"/>
          <link type="boardgamemechanic" id="2041" value="Card Drafting"/>
          <link type="boardgamemechanic" id="2912" value="Contracts"/>
          <link type="boardgamemechanic" id="2004" value="Set Collection"/>
          <link type="boardgamefamily" id="33250" value="Game: Splendor"/>
          <link type="boardgamefamily" id="27646" value="Mechanism: Tableau Building"/>
          <link type="boardgameexpansion" id="220653" value="Splendor: Cities of Splendor"/>
          <link type="boardgameexpansion" id="233847" value="Splendor: Cities of Splendor Promotional Tile"/>
          <link type="boardgameexpansion" id="292898" value="Splendor: Cities of Splendor – Dice Con 2019 City Promo Tile"/>
          <link type="boardgameimplementation" id="293296" value="Splendor Marvel"/>
          <link type="boardgamedesigner" id="50969" value="Marc André"/>
          <link type="boardgameartist" id="119788" value="Abbas Amirabadi"/>
          <link type="boardgameartist" id="119789" value="Mahmoud Arasteh Nasab"/>
          <link type="boardgameartist" id="14878" value="Pascal Quidault"/>
          <link type="boardgamepublisher" id="25842" value="Space Cowboys"/>
          <link type="boardgamepublisher" id="157" value="Asmodee"/>
          <videos total="324">
            <video id="285312" title="How to setup play and review Splendor" category="review" language="English" link="http://www.youtube.com/watch?v=rIzAdePKHy0" username="boulderman" userid="1206296" postdate="2020-10-06T11:05:13-05:00"/>
            <video id="285181" title="Splendor (beanview) with 0ctavian" category="humor" language="English" link="http://www.youtube.com/watch?v=lxbeF63gsi4" username="Octavian1" userid="2697904" postdate="2020-10-05T22:31:49-05:00"/>
            <video id="283121" title="Tutorial Main Board Game - Splendor (In Indonesian)" category="instructional" language="Indonesian" link="http://www.youtube.com/watch?v=sd71LuWS6dc" username="RwHsAvIrE" userid="442679" postdate="2020-09-22T21:21:01-05:00"/>
          </videos>
          <versions>
            <item type="boardgameversion" id="417491">
              <link type="boardgameversion" id="148228" value="Splendor" inbound="true"/>
              <name type="primary" sortindex="1" value="Arabic/English edition"/>
              <link type="boardgamepublisher" id="34501" value="Boardgame Space"/>
              <link type="boardgamepublisher" id="25842" value="Space Cowboys"/>
              <link type="boardgameartist" id="14878" value="Pascal Quidault"/>
              <yearpublished value="2018"/>
              <productcode value="SCSPL01AR"/>
              <width value="0"/>
              <length value="0"/>
              <depth value="0"/>
              <weight value="0"/>
              <link type="language" id="2178" value="Arabic"/>
              <link type="language" id="2184" value="English"/>
            </item>
              <item type="boardgameversion" id="317169">
              <thumbnail>https://cf.geekdo-images.com/thumb/img/unaZk-IYAAPJ43BYVEf8MnK4Q_4=/fit-in/200x150/filters:strip_icc()/pic3087720.png</thumbnail>
              <image>https://cf.geekdo-images.com/original/img/MuiGF9ZfdBO4oKFBWL46wvp6_sQ=/0x0/pic3087720.png</image>
              <link type="boardgameversion" id="148228" value="Splendor" inbound="true"/>
              <name type="primary" sortindex="1" value="Broadway Toys Chinese edition"/>
              <link type="boardgamepublisher" id="9068" value="Broadway Toys LTD"/>
              <yearpublished value="0"/>
              <productcode value="BW0033"/>
              <width value="0"/>
              <length value="0"/>
              <depth value="0"/>
              <weight value="0"/>
              <link type="language" id="2181" value="Chinese"/>
            </item>
          </versions>
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
    expect(boardGame.description, equals("Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops—all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.\n\n"));
    expect(boardGame.thumbnail, equals(Uri.parse('https://cf.geekdo-images.com/thumb/img/D4hkkHfOgu22PwgJomjplWAveuo=/fit-in/200x150/filters:strip_icc()/pic1904079.jpg')));
    expect(boardGame.image, equals(Uri.parse('https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg')));
    expect(boardGame.videos.length, equals(3));
    expect(boardGame.videos[0].id, equals(285312));
    expect(boardGame.videos[0].title, equals('How to setup play and review Splendor'));
    expect(boardGame.names, equals(['Splendor', 'Goharneshan (گوهرنشان)', 'Роскошь']));
  });
}