import 'dart:io';
import 'package:deezer/deezer.dart';
import 'package:test/test.dart';

void main() {
  late Deezer deezer;
  test('Test Deezer instance creation', () async {
    String arl = "get your arl from deezer.com cookie";
    deezer = await Deezer.create(arl: arl);
    expect(deezer, isNotNull);
  });

  test('Test search functionality', () async {
    var searchResult = await deezer.search("Hello");
    expect(searchResult, isNotNull);
  });

  test('Test getTrack functionality', () async {
    var track = await deezer.getTrack("138545995");
    expect(track, isNotNull);
  });

  test('Test getTracks functionality', () async {
    var tracks = await deezer.getTracks(["138545995", "1439299952"]);
    expect(tracks, isNotNull);
  });

  test('Test favSongs functionality', () async {
    var fav = await deezer.favSongs();
    expect(fav, isNotNull);
  });

  test('Test writing the downloaded song to a file', () async {
    File file = File("song_test.mp3");
    final songData = await deezer.getSong("1439299952");
    await file.writeAsBytes(songData!.data!);
    expect(await file.exists(), isTrue);
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
  });
}
