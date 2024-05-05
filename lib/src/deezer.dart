import 'dart:async';
import 'package:blowfish/blowfish.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:deezer/src/models/fav/fav.dart';
import 'package:deezer/src/models/search/search_results.dart';
import 'package:deezer/src/models/song/song_data.dart';
import 'package:deezer/src/models/track/track.dart';
import 'package:deezer/src/models/track/tracks.dart';
import 'package:deezer/src/utils/api.dart';
import 'package:deezer/src/utils/decrypt.dart';
import 'package:dio/dio.dart';

class Deezer {
  final String arl;
  final bool isRefresh;
  final Duration duration;
  late Dio client;
  late String token;

  CookieJar cookieJar = CookieJar();

  Deezer._({
    required this.arl,
    this.isRefresh = false,
    this.duration = const Duration(minutes: 30),
  }) {
    client = createDioClient(arl, cookieJar);
  }

  static Future<Deezer> create({
    required String arl,
    bool isRefresh = false,
    Duration duration = const Duration(minutes: 30),
  }) async {
    try {
      if (arl.length < 30) {
        throw Exception("Invalid arl");
      }
      var deezer = Deezer._(arl: arl, isRefresh: isRefresh, duration: duration);
      await deezer._init(isRefresh, duration);
      return deezer;
    } catch (e) {
      print("Failed to create Deezer instance: $e");
      return Deezer._(arl: arl, isRefresh: isRefresh, duration: duration);
    }
  }

  Future<void> _init([
    bool refreshtk = false,
    Duration duration = const Duration(minutes: 30),
  ]) async {
    // create new token
    token = await getAccessToken(client);
    while (refreshtk) {
      await Future.delayed(duration);
      token = await getAccessToken(client);
    }
  }

  // Search for songs
  Future<Result?> search(String query) async {
    try {
      return Result.fromJson((await searchSongs(client, query)).data);
    } catch (e) {
      print("Failed to search: $e");
      return null;
    }
  }

  // Get Favorite Songs
  Future<Favourites?> favSongs() async {
    try {
      return Favourites.fromJson((await getFavoriteSongs(client, token)).data);
    } catch (e) {
      print("Failed to get favorite songs: $e");
      return null;
    }
  }

  // Add Favorite Songs
  Future<bool> addFavSongs(List<String> ids) async {
    try {
      Response response = await addFavoriteSong(client, ids, token);

      if (response.data['error'] is Map) {
        throw Exception(response.data['error']);
      }

      print("Success: ${response.data['results']}");
      return true;
    } catch (e) {
      print("Failed to add favorite songs: $e");
      return false;
    }
  }

// Remove Favorite Songs
  Future<bool> removeFavSongs(List<String> ids) async {
    try {
      Response response = await removeFavoriteSong(client, ids, token);

      if (response.data['error'] is Map) {
        throw Exception(response.data['error']);
      }

      return true;
    } catch (e) {
      print("Failed to remove favorite songs: $e");
      return false;
    }
  }

  // Get Track info
  Future<Track?> getTrack(String id) async {
    try {
      Response response = await trackinfo(client, id, token);
      if (response.data['results']['DATA']['MD5_ORIGIN'] == null) {
        throw Exception("Login expired add new arl");
      } else {
        return Track.fromJson(response.data);
      }
    } catch (e) {
      print("Failed to get track: $e");
      return null;
    }
  }

  // Get Tracks info
  Future<Tracks?> getTracks(List<String> ids) async {
    try {
      Response response = await tracksinfo(client, ids, token);
      if (response.data['results']['data'][0]['MD5_ORIGIN'] == null) {
        throw Exception("Login expired add new arl");
      } else {
        return Tracks.fromJson(response.data);
      }
    } catch (e) {
      print("Failed to get tracks: $e");
      return null;
    }
  }

  // Get Song (download)
  Future<SongData?> getSong(String id, [String format = "1"]) async {
    try {
      // print("Getting song...");
      Track? track = await getTrack(id);
      if (track == null) {
        return null;
      } else {
        print(track.results.data.md5Origin);
        String url = await getDownloadLink(
          track.results.data.md5Origin,
          id,
          format,
          track.results.data.mediaVersion,
        );
        // print("download url: $url");
        Response response = await client.get(
          url,
          options: Options(responseType: ResponseType.bytes),
        );
        return SongData(
          data: await decryptMedia(response.data, track.results.data.sngId),
          track: track,
        );
      }
    } catch (e) {
      print("Failed to get song: $e");
      return null;
    }
  }

  Stream<List<int>> streamSong(String id, [String format = "1"]) async* {
    try {
      Track? track = await getTrack(id);
      if (track == null) {
        return;
      } else {
        String url = await getDownloadLink(
          track.results.data.md5Origin,
          id,
          format,
          track.results.data.mediaVersion,
        );
        Response response = await client.get(
          url,
          options: Options(responseType: ResponseType.stream),
        );

        yield* decryptStream(
          response,
          track.results.data.sngId,
        );
        print("Streaming song complete");
      }
    } catch (e) {
      print("Failed to stream song: $e");
    }
  }

  // return lib functions so that users can even use them
  String genBFKey(String sid) {
    return generateBlowfishKey(sid);
  }

  Future<List<int>> decMedia(List<int> data, String sid) async {
    return await decryptMedia(data, sid);
  }

  Stream<List<int>> decStream(Response response, String sid) async* {
    yield* decryptStream(response, sid);
  }

  Future<List<int>> decBlowfish(List<int> data, Blowfish blowfish) async {
    return await decryptBlowfish(data, blowfish);
  }

  Future<String> downloadLink(
    String md5Origin,
    String id,
    String format,
    String mediaVersion,
  ) async {
    return await getDownloadLink(md5Origin, id, format, mediaVersion);
  }
}
