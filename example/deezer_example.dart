import 'dart:io';

import 'package:deezer/deezer.dart';

void main() async {
  String arl = "get it from your browser cookies";

  // create a deezer instance
  Deezer deezer = await Deezer.create(arl: arl);

  // search for a song
  var result = await deezer.search("Hello");
  if (result != null) {
    // print(result.toJson());
  } else {
    print("Result is null");
  }

  // get track info
  var track = await deezer.getTrack("138545995");
  if (track != null) {
    print(track.results.data.toJson());
  } else {
    print("Track is null");
  }

  // get tracks info
  var tracks = await deezer.getTracks(["138545995", "1439299952"]);
  if (tracks != null) {
    print(tracks.results.toJson());
  } else {
    print("Track is null");
  }

  // get fav songs
  var fav = await deezer.favSongs();
  if (fav != null) {
    print(fav.results.toJson());
  } else {
    print("Fav is null");
  }

  // remove Favourites
  bool removeFav = await deezer.removeFavSongs(["1439299952"]);
  print("Remove Fav: $removeFav");

  // add Favourites
  bool addfav = await deezer.addFavSongs(["1439299952"]);
  print("Fav: $addfav");

  // download a song
  final song = await deezer.getSong("1439299952");
  // write the song to a file
  if (song!.data != null) {
    File file = File("song.mp3");
    file.writeAsBytesSync(song.data!);
    print("Song downloaded");
  } else {
    print("Song is null");
  }

  // download a song using stream
  final stream = deezer.streamSong("1439299952");
  File file = File("stream_song.mp3");
  IOSink sink = file.openWrite();
  await for (List<int> chunk in stream) {
    sink.add(chunk);
  }
  await sink.flush();
  await sink.close();
  print("Stream song downloaded");
}
