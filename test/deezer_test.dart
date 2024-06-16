import 'dart:developer';
import 'dart:io';
import 'package:deezer/deezer.dart';
import 'package:test/test.dart';

void main() {
  late Deezer deezer;
  String arl = "GET_YOUR_ARL_FROM_DEEZER_COOKIE";

  // check if the deezer instance is created
  test('Test Deezer instance creation', () async {
    log("Creating Deezer instance");
    deezer = await Deezer.create(arl: arl);
    expect(deezer, isNotNull);
    log("Deezer instance created");
  });

  // mobile api tests

  test('Test Get Album functionality', () async {
    log("Getting album");
    var album = await deezer.getAlbum("302127");
    expect(album, isNotNull);
    log("Album title: ${album?.title}");
  });

  test('Test Get Album Tracks functionality', () async {
    log("Getting album tracks");
    var albumTracks = await deezer.getAlbumTracks("302127");
    expect(albumTracks, isNotNull);
    log("Album tracks: ${albumTracks?.data?.length}");
  });

  // ------- Artist API -------

  test('Test Get Artist functionality', () async {
    log("Getting artist");
    var artist = await deezer.getArtist("27");
    expect(artist, isNotNull);
    log("Artist name: ${artist?.name}");
  });

  test('Test Get Artist Top Tracks functionality', () async {
    log("Getting artist top tracks");
    var artistTracks = await deezer.getArtistTopTracks("27");
    expect(artistTracks, isNotNull);
    log("Artist top tracks: ${artistTracks?.data?.length}");
  });

  test('Test Get Artist Albums functionality', () async {
    log("Getting artist albums");
    var artistAlbums = await deezer.getArtistAlbums("27");
    expect(artistAlbums, isNotNull);
    log("Artist albums: ${artistAlbums?.data?.length}");
  });

  test('Test Get Artist Related Artists functionality', () async {
    log("Getting artist related artists");
    var relatedArtists = await deezer.getArtistRelated("27");
    expect(relatedArtists, isNotNull);
    log("Related artists: ${relatedArtists?.data?.length}");
  });

  test('Test Get Artist Radios functionality', () async {
    log("Getting artist radios");
    var artistRadios = await deezer.getArtistRadios("27");
    expect(artistRadios, isNotNull);
    log("Artist radios: ${artistRadios?.data?.length}");
  });

  test('Test Get Artist Playlists functionality', () async {
    log("Getting artist playlists");
    var artistPlaylists = await deezer.getArtistPlaylists("27");
    expect(artistPlaylists, isNotNull);
    log("Artist playlists: ${artistPlaylists?.data?.length}");
  });

  // ------- Chart API -------

  test('Test Get Chart functionality', () async {
    log("Getting chart");
    var chart = await deezer.getChart("0");
    expect(chart, isNotNull);
    log("Chart albums: ${chart?.albums?.data?.length}");
    log("Chart artists: ${chart?.artists?.data?.length}");
    log("Chart playlists: ${chart?.playlists?.data?.length}");
    log("Chart podcasts: ${chart?.podcasts?.data?.length}");
    log("Chart tracks: ${chart?.tracks?.data?.length}");
  });

  test('Test Get Chart Top Tracks functionality', () async {
    log("Getting chart top tracks");
    var chartTracks = await deezer.getChartTopTracks("0");
    expect(chartTracks, isNotNull);
    log("Chart top tracks: ${chartTracks?.data?.length}");
  });

  test('Test Get Chart Top Albums functionality', () async {
    log("Getting chart top albums");
    var chartAlbums = await deezer.getChartTopAlbums("0");
    expect(chartAlbums, isNotNull);
    log("Chart top albums: ${chartAlbums?.data?.length}");
  });

  test('Test Get Chart Top Artists functionality', () async {
    log("Getting chart top artists");
    var chartArtists = await deezer.getChartTopArtists("0");
    expect(chartArtists, isNotNull);
    log("Chart top artists: ${chartArtists?.data?.length}");
  });

  test('Test Get Chart Top Playlists functionality', () async {
    log("Getting chart top playlists");
    var chartPlaylists = await deezer.getChartTopPlaylists("0");
    expect(chartPlaylists, isNotNull);
    log("Chart top playlists: ${chartPlaylists?.data?.length}");
  });

  test('Test Get Chart Top Podcasts functionality', () async {
    log("Getting chart top podcasts");
    var chartPodcasts = await deezer.getChartTopPodcasts("0");
    expect(chartPodcasts, isNotNull);
    log("Chart top podcasts: ${chartPodcasts?.data?.length}");
  });

  // ------- Editorial API -------

  test('Test Get Editorials functionality', () async {
    log("Getting editorials");
    var editorials = await deezer.getEditorials();
    expect(editorials, isNotNull);
    log("Editorials: ${editorials?.data?.length}");
  });

  test('Test Get Editorial functionality', () async {
    log("Getting editorial");
    var editorial = await deezer.getEditorial("0");
    expect(editorial, isNotNull);
    log("Editorial title: ${editorial?.name}");
  });

  // ------- Genre API -------

  test('Test Get Genres functionality', () async {
    log("Getting genres");
    var genres = await deezer.getGenres();
    expect(genres, isNotNull);
    log("Genres: ${genres?.data?.length}");
  });

  test('Test Get Genre functionality', () async {
    log("Getting genre");
    var genre = await deezer.getGenre("132");
    expect(genre, isNotNull);
    log("Genre name: ${genre?.name}");
  });

  test('Test Get Genre Artists functionality', () async {
    log("Getting genre artists");
    var genreArtists = await deezer.getGenreArtists("132");
    expect(genreArtists, isNotNull);
    log("Genre artists: ${genreArtists?.data?.length}");
  });

  test('Test Get Genre Radios functionality', () async {
    log("Getting genre radios");
    var genreRadios = await deezer.getGenreRadios("132");
    expect(genreRadios, isNotNull);
    log("Genre radios: ${genreRadios?.data?.length}");
  });

  // ------- Playlist API -------

  test('Test Get Playlist functionality', () async {
    log("Getting playlist");
    var playlist = await deezer.getPlaylist("908622995");
    expect(playlist, isNotNull);
    log("Playlist title: ${playlist?.title}");
  });

  test('Test Get Playlist Tracks functionality', () async {
    log("Getting playlist tracks");
    var playlistTracks = await deezer.getPlaylistTracks("908622995");
    expect(playlistTracks, isNotNull);
    log("Playlist tracks: ${playlistTracks?.data?.length}");
  });

  // ------- Radio API -------

  test('Test Get Radio functionality', () async {
    log("Getting radio");
    var radio = await deezer.getRadio("37151");
    expect(radio, isNotNull);
    log("Radio title: ${radio?.title}");
  });

  test('Test Get Radio Tracks functionality', () async {
    log("Getting radio tracks");
    var radioTracks = await deezer.getRadioTracks("37151");
    expect(radioTracks, isNotNull);
    log("Radio tracks: ${radioTracks?.data?.length}");
  });

  test('Test Get Radio Genres functionality', () async {
    log("Getting radio genres");
    var radioGenres = await deezer.getRadioGenres("37151");
    expect(radioGenres, isNotNull);
    log("Radio genres: ${radioGenres?.data?.length}");
  });

  test('Test Get Radio Top functionality', () async {
    log("Getting radio top");
    var radioTop = await deezer.getRadioTop("37151");
    expect(radioTop, isNotNull);
    log("Radio top: ${radioTop?.data?.length}");
  });

  test('Test Get Radio List functionality', () async {
    log("Getting radio list");
    var radioList = await deezer.getRadioList("37151");
    expect(radioList, isNotNull);
    log("Radio list: ${radioList?.data?.length}");
  });

  // ------- Search API -------

  test('Test Search Albums functionality', () async {
    log("Searching albums");
    var searchAlbums = await deezer.searchAlbums("Imagine Dragons");
    expect(searchAlbums, isNotNull);
    log("Albums: ${searchAlbums?.data?.length}");
  });

  test('Test Search Artists functionality', () async {
    log("Searching artists");
    var searchArtists = await deezer.searchArtists("Imagine Dragons");
    expect(searchArtists, isNotNull);
    log("Artists: ${searchArtists?.data?.length}");
  });

  test('Test Search Playlists functionality', () async {
    log("Searching playlists");
    var searchPlaylists = await deezer.searchPlaylists("Chill");
    expect(searchPlaylists, isNotNull);
    log("Playlists: ${searchPlaylists?.data?.length}");
  });

  test('Test Search Tracks functionality', () async {
    log("Searching tracks");
    var searchTracks = await deezer.searchTracks("Believer");
    expect(searchTracks, isNotNull);
    log("Tracks: ${searchTracks?.data?.length}");
  });

  test('Test Search Users functionality', () async {
    log("Searching users");
    var searchUsers = await deezer.searchUsers("John Doe");
    expect(searchUsers, isNotNull);
    log("Users: ${searchUsers?.data?.length}");
  });

  test('Test Search Radios functionality', () async {
    log("Searching radios");
    var searchRadios = await deezer.searchRadios("Rock");
    expect(searchRadios, isNotNull);
    log("Radios: ${searchRadios?.data?.length}");
  });

  // ------- User API -------

  test('Test Get User functionality', () async {
    log("Getting user");
    var user = await deezer.getUser("5");
    expect(user, isNotNull);
    log("User name: ${user?.name}");
  });

  test('Test Get User Albums functionality', () async {
    log("Getting user albums");
    var userAlbums = await deezer.getUserAlbums("5");
    expect(userAlbums, isNotNull);
    log("User albums: ${userAlbums?.data?.length}");
  });

  test('Test Get User Artists functionality', () async {
    log("Getting user artists");
    var userArtists = await deezer.getUserArtists("5");
    expect(userArtists, isNotNull);
    log("User artists: ${userArtists?.data?.length}");
  });

  test('Test Get User Tracks functionality', () async {
    log("Getting user tracks");
    var userTracks = await deezer.getUserTracks("5");
    expect(userTracks, isNotNull);
    log("User tracks: ${userTracks?.data?.length}");
  });

  test('Test Get User Radios functionality', () async {
    log("Getting user radios");
    var userRadios = await deezer.getUserRadios("5");
    expect(userRadios, isNotNull);
    log("User radios: ${userRadios?.data?.length}");
  });

  test('Test Get User Chart Tracks functionality', () async {
    log("Getting user chart tracks");
    var userChartTracks = await deezer.getUserChartTracks("5");
    expect(userChartTracks, isNotNull);
    log("User chart tracks: ${userChartTracks?.data?.length}");
  });

  test('Test Get User Chart Albums functionality', () async {
    log("Getting user chart albums");
    var userChartAlbums = await deezer.getUserChartAlbums("5");
    expect(userChartAlbums, isNotNull);
    log("User chart albums: ${userChartAlbums?.data?.length}");
  });

  test('Test Get User Chart Artists functionality', () async {
    log("Getting user chart artists");
    var userChartArtists = await deezer.getUserChartArtists("5");
    expect(userChartArtists, isNotNull);
    log("User chart artists: ${userChartArtists?.data?.length}");
  });

  test('Test Get User Chart Playlists functionality', () async {
    log("Getting user chart playlists");
    var userChartPlaylists = await deezer.getUserChartPlaylists("5");
    expect(userChartPlaylists, isNotNull);
    log("User chart playlists: ${userChartPlaylists?.data?.length}");
  });

  test('Test Get User Flow functionality', () async {
    log("Getting user flow");
    var userFlow = await deezer.getUserFlow("5");
    expect(userFlow, isNotNull);
    log("User flow: ${userFlow?.data?.length}");
  });

  test('Test Get User Followings functionality', () async {
    log("Getting user followings");
    var userFollowings = await deezer.getUserFollowings("5");
    expect(userFollowings, isNotNull);
    log("User followings: ${userFollowings?.data?.length}");
  });

  test('Test Get User Followers functionality', () async {
    log("Getting user followers");
    var userFollowers = await deezer.getUserFollowers("5");
    expect(userFollowers, isNotNull);
    log("User followers: ${userFollowers?.data?.length}");
  });

  test('Test Get User Playlists functionality', () async {
    log("Getting user playlists");
    var userPlaylists = await deezer.getUserPlaylists("5");
    expect(userPlaylists, isNotNull);
    log("User playlists: ${userPlaylists?.data?.length}");
  });

  test('Test getTrack functionality', () async {
    log("Getting track");
    var track = await deezer.getTrack("138545995");
    expect(track, isNotNull);
    log("Track title: ${track?.results.data.sngTitle}");
  });

  test('Test getTracks functionality', () async {
    log("Getting tracks");
    var tracks = await deezer.getTracks(["138545995", "1439299952"]);
    expect(tracks, isNotNull);
    log("Tracks: ${tracks?.results.data.length}");
  });

  test('Test favSongs functionality', () async {
    log("Getting fav songs");
    var fav = await deezer.favSongs();
    expect(fav, isNotNull);
    log("Fav songs: ${fav?.results.data.length}");
  });

  test('Test writing the downloaded song to a file', () async {
    File file = File("song_test.mp3");
    final songData = await deezer.getSong("1439299952");
    if (songData != null) {
      await file.writeAsBytes(songData.data);
    }
    expect(await file.exists(), isTrue);
  log("");
  });

  test('Test downloading a song using stream', () async {
    File streamFile = File("stream_song_test.mp3");
    IOSink sink = streamFile.openWrite();
    var stream = deezer.streamSong("1439299952");
    await for (List<int> chunk in stream) {
      sink.add(chunk);
    }
    await sink.flush();
    await sink.close();
    expect(await streamFile.exists(), isTrue);
  log("");
  });
}
