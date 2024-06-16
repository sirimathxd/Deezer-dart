import 'dart:async';
import 'dart:developer';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:deezer/src/api/mobile/mobile_api.dart';
import 'package:deezer/src/api/web/web_api.dart';
import 'package:deezer/src/models/mobile/album/album.dart';
import 'package:deezer/src/models/mobile/album/artist_album.dart';
import 'package:deezer/src/models/mobile/album/chart_album.dart';
import 'package:deezer/src/models/mobile/album/search_album.dart';
import 'package:deezer/src/models/mobile/album/user_album.dart';
import 'package:deezer/src/models/mobile/artist/artist.dart';
import 'package:deezer/src/models/mobile/artist/chart_artist.dart';
import 'package:deezer/src/models/mobile/artist/user_artist.dart';
import 'package:deezer/src/models/mobile/chart/chart.dart';
import 'package:deezer/src/models/mobile/genre/genre.dart';
import 'package:deezer/src/models/mobile/genre/radio_genre.dart';
import 'package:deezer/src/models/mobile/playlist/artist_playlist.dart';
import 'package:deezer/src/models/mobile/playlist/chart_playlist.dart';
import 'package:deezer/src/models/mobile/playlist/playlist.dart';
import 'package:deezer/src/models/mobile/playlist/user_playlist.dart';
import 'package:deezer/src/models/mobile/podcasts/podcasts.dart';
import 'package:deezer/src/models/mobile/radio/artist_radio.dart';
import 'package:deezer/src/models/mobile/radio/radio.dart';
import 'package:deezer/src/models/mobile/track/album_track.dart';
import 'package:deezer/src/models/mobile/track/artist_track.dart';
import 'package:deezer/src/models/mobile/track/chart_track.dart';
import 'package:deezer/src/models/mobile/track/flow_track.dart';
import 'package:deezer/src/models/mobile/track/playlist_track.dart';
import 'package:deezer/src/models/mobile/track/radio_track.dart';
import 'package:deezer/src/models/mobile/track/user_chart_track.dart';
import 'package:deezer/src/models/mobile/track/user_track.dart';
import 'package:deezer/src/models/mobile/user/user_with_pic.dart';
import 'package:deezer/src/models/mobile/user/user.dart';
import 'package:deezer/src/models/web/favourite/favourite.dart';
import 'package:deezer/src/models/song/song_data.dart';
import 'package:deezer/src/models/web/track/track.dart';
import 'package:deezer/src/models/web/track/tracks.dart';
import 'package:deezer/src/utils/decrypt.dart';
import 'package:deezer/src/utils/exceptions.dart';
import 'package:deezer/src/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

part 'deezer_mobile.dart';
part 'deezer_web.dart';

// Deezer API URL (mobile)
const String mobileUrl = 'https://api.deezer.com';
// Deezer API URL (web)
const String webUrl = "https://www.deezer.com/ajax/gw-light.php";

// Progress callback to track download progress
typedef ProgressCallback = void Function(int received, int total);

class Deezer {
  final String arl; // get the arl from the browser cookies when logged in
  final bool isRefresh; // make the token refresh (default: false)
  final Duration
      duration; // duration to wait before refreshing token (default: 30 minutes)
  late Dio client; // dio client for making requests
  late String token; // access token for making requests

  // cookie jar for storing cookies for the session
  CookieJar cookieJar = CookieJar();

  // create Deezer instance with arl
  Deezer._({
    required this.arl,
    this.isRefresh = false,
    this.duration = const Duration(minutes: 30),
  }) {
    // create dio client with cookie jar
    client = createDioClient(arl, cookieJar);
  }

  // create Deezer instance
  static Future<Deezer> create({
    required String arl,
    bool isRefresh = false,
    Duration duration = const Duration(minutes: 30),
  }) async {
    if (arl.length < 30) {
      log("Invalid arl. Failed to create Deezer instance.");
      throw DeezerException.invalidARL(
        message: "Invalid arl. Failed to create Deezer instance.",
      );
    }

    var deezer = Deezer._(arl: arl, isRefresh: isRefresh, duration: duration);
    try {
      await deezer._init(isRefresh, duration); // initialize the instance
      return deezer;
    } catch (e, s) {
      log("Failed to initialize Deezer instance: $e");
      if (e is DeezerException) {
        rethrow;
      } else {
        throw DeezerException.initFailed(
          message: "Failed to initialize Deezer instance: $e",
          error: e,
          stackTrace: s,
        );
      }
    }
  }

  // initialize the instance with token
  Future<void> _init([
    bool refreshtk = false,
    Duration duration = const Duration(minutes: 30),
  ]) async {
    // create new token
    token = await getAccessToken(client);
    // refresh token after duration
    while (refreshtk) {
      await Future.delayed(duration);
      token = await getAccessToken(client);
    }
  }

  // refresh the token
  Future<void> refresh() async {
    token = await getAccessToken(client); // get new token
  }

  // create an Dio client with default cookies
  Dio createDioClient(String arl, CookieJar cookieJar) {
    return Dio(
      BaseOptions(
        baseUrl: 'https://deezer.com',
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
          'Cookie': 'arl=$arl',
        },
      ),
    )..interceptors.add(
        CookieManager(
          cookieJar,
        ),
      );
  }

  // Get Song (download)
  Future<SongData?> getSong(
    String id, {
    String format = "1",
    bool throwOnError = false,
    ProgressCallback? onProgress,
  }) async {
    try {
      // Get track info
      Track? track = await getTrack(id, throwOnError: throwOnError);
      if (track == null) {
        log('Failed to get song with id $id');
        return null;
      }

      // Get download link
      String url = await getDownloadLink(
        track.results.data.md5Origin,
        id,
        format,
        track.results.data.mediaVersion,
      );

      // print("download link: $url");

      // Get Encrypted song data
      Response response = await client.get(
        url,
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: (received, total) {
          if (onProgress != null) {
            onProgress(received, total);
          }
        },
      );

      // Get Decrypted song data
      List<int> data = await decryptMedia(
        response.data,
        track.results.data.sngId,
      );

      // Return song data
      return SongData(
        data: data,
        track: track,
      );
    } catch (e) {
      log('Failed to get song with id $id: $e');
      if (!throwOnError) {
        return null;
      }
      if (e is DeezerException) {
        rethrow;
      } else {
        throw DeezerException(
          type: DeezerExceptionType.unknown,
          message: 'Failed to get song with id $id: $e',
          error: e,
        );
      }
    }
  }

  Stream<List<int>> streamSong(
    String id, {
    String format = "1",
    bool throwOnError = false,
    ProgressCallback? onProgress,
  }) async* {
    try {
      // Get track info
      Track? track = await getTrack(id, throwOnError: throwOnError);

      // Get download link
      String url = await getDownloadLink(
        track!.results.data.md5Origin,
        id,
        format,
        track.results.data.mediaVersion,
      );

      // Get song data as stream
      Response response = await client.get(
        url,
        options: Options(responseType: ResponseType.stream),
      );

      // Decrypt and yield song data
      yield* decryptStream(
        response,
        track.results.data.sngId,
        onProgress: (received, total) {
          if (onProgress != null) {
            onProgress(received, total);
          }
        },
      );
    } catch (e) {
      log('Failed to stream song with id $id: $e');
      if (e is DeezerException) {
        rethrow;
      } else {
        throw DeezerException(
          type: DeezerExceptionType.unknown,
          message: 'Failed to stream song with id $id: $e',
          error: e,
        );
      }
    }
  }

  // close the session
  void close() {
    cookieJar.deleteAll(); // delete all cookies
    client.close(); // close the client
  }
}
