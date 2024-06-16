import 'dart:developer';

import 'package:deezer/deezer.dart';
import 'package:dio/dio.dart';

// This file contains all the API paths and functions to fetch data from the Deezer API

// -------------- GET API PATHS --------------

// these are the paths to fetch data from the Deezer API

// Get Album path
String getAlbumPath(ALBUM album, String id) {
  switch (album) {
    case ALBUM.details:
      return '/album/$id';
    case ALBUM.tracks:
      return '/album/$id/tracks';
    default:
      return '';
  }
}

// Get Artist path
String getArtistPath(ARTIST artist, String id) {
  switch (artist) {
    case ARTIST.details:
      return '/artist/$id';
    case ARTIST.albums:
      return '/artist/$id/albums';
    case ARTIST.relatedArtists:
      return '/artist/$id/related';
    case ARTIST.topTracks:
      return '/artist/$id/top';
    case ARTIST.radios:
      return '/artist/$id/radio';
    case ARTIST.playlists:
      return '/artist/$id/playlists';
    default:
      return '';
  }
}

// Get Chart path
String getChartPath(CHART chart, String id) {
  switch (chart) {
    case CHART.all:
      return '/chart/$id';
    case CHART.topTracks:
      return '/chart/$id/tracks';
    case CHART.topAlbums:
      return '/chart/$id/albums';
    case CHART.topArtists:
      return '/chart/$id/artists';
    case CHART.topPlaylists:
      return '/chart/$id/playlists';
    case CHART.topPodcasts:
      return '/chart/$id/podcasts';
    default:
      return '';
  }
}

// Get Editorial path
String getEditorialPath(EDITORIALS editorial, String id) {
  switch (editorial) {
    case EDITORIALS.all:
      return '/editorial';
    case EDITORIALS.details:
      return '/editorial/$id';
    default:
      return '';
  }
}

// Get Genre path
String getGenrePath(GENRE genre, String id) {
  switch (genre) {
    case GENRE.all:
      return '/genre';
    case GENRE.details:
      return '/genre/$id';
    case GENRE.artists:
      return '/genre/$id/artists';
    case GENRE.radios:
      return '/genre/$id/radios';
    default:
      return '';
  }
}

// Get Playlist path
String getPlaylistPath(PLAYLIST playlist, String id) {
  switch (playlist) {
    case PLAYLIST.details:
      return '/playlist/$id';
    case PLAYLIST.tracks:
      return '/playlist/$id/tracks';
    default:
      return '';
  }
}

// Get Radio path
String getRadioPath(RADIO radio, String id) {
  switch (radio) {
    case RADIO.radios:
      return '/radio';
    case RADIO.tracks:
      return '/radio/$id/tracks';
    case RADIO.genres:
      return '/radio/genres';
    case RADIO.top:
      return '/radio/top';
    case RADIO.list:
      return '/radio/lists';
    default:
      return '';
  }
}

// Get Search path
String getSearchPath(SEARCH search, String q) {
  switch (search) {
    case SEARCH.album:
      return '/search/album?q=$q';
    case SEARCH.artist:
      return '/search/artist?q=$q';
    case SEARCH.playlist:
      return '/search/playlist?q=$q';
    case SEARCH.track:
      return '/search/track?q=$q';
    case SEARCH.user:
      return '/search/user?q=$q';
    case SEARCH.radio:
      return '/search/radio?q=$q';
    // case SEARCH.advandced:
    //   return '/search?q=$q';
    default:
      return '';
  }
}

// Get User path
String getUserPath(USER user, String id) {
  switch (user) {
    case USER.details:
      return '/user/$id';
    case USER.albums:
      return '/user/$id/albums';
    case USER.artists:
      return '/user/$id/artists';
    case USER.chartsAlbums:
      return '/user/$id/charts/albums';
    case USER.chartsArtists:
      return '/user/$id/charts/artists';
    case USER.chartsPlaylists:
      return '/user/$id/charts/playlists';
    case USER.chartsTracks:
      return '/user/$id/charts/tracks';
    case USER.flow:
      return '/user/$id/flow';
    case USER.followings:
      return '/user/$id/followings';
    case USER.followers:
      return '/user/$id/followers';
    case USER.playlists:
      return '/user/$id/playlists';
    case USER.radios:
      return '/user/$id/radios';
    case USER.tracks:
      return '/user/$id/tracks';
    default:
      return '';
  }
}

// -------------- API GET --------------

// Get request to fetch data
// Most of the API requests are similar, so we can use a single function to fetch data
// This function takes a Dio client and a URL as input and returns a Response
Future<Response> get(Dio client, String url) async {
  try {
    Response response = await client.get(mobileUrl+url);
    // print('Response: ${response.data}');
    if (response.statusCode == 200) {
      return response; // return response if request is successful
    } else {
      throw DeezerException(
        type: DeezerExceptionType.invalidResponse,
        message: "Invalid Responce: ${response.statusCode} and response: ${response.data}",
      );
    }
  } catch (e, s) {
    log('Error: $e', stackTrace: s);
    if (e is DioException) {
      throw DeezerException(
        type: DeezerExceptionType.network,
        message: "Network error: ${e.message}",
        error: e,
        stackTrace: s,
      );
    } else if (e is DeezerException) {
      rethrow;
    } else {
      throw DeezerException(
        type: DeezerExceptionType.unknown,
        message: "Unknown error: $e",
        error: e,
        stackTrace: s,
      );
    }
  }
}