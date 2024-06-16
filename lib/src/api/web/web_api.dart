import 'dart:developer';

import 'package:deezer/deezer.dart';
import 'package:dio/dio.dart';

// This file contains all the API paths and functions to fetch data from the Deezer API

// Get Track info
Future<Response> trackinfo(Dio client, String id, String token) async {
  try {
    Response res = await client.post(
      "$webUrl?api_token=$token&api_version=1.0&input=3&method=deezer.pageTrack",
      data: {"sng_id": id},
      options: Options(contentType: "application/json"),
    );
    // md5_origin is null if the login is expired
    // without the md5_origin user can't access the track
    if (res.data['results']['DATA']['MD5_ORIGIN'] == null) {
      throw DeezerException(
        type: DeezerExceptionType.invalidToken,
        message: "Invalid token: Try to refresh the token or add new arl",
      );
    } else {
      return res;
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

// Get Tracks info
Future<Response> tracksinfo(Dio client, List<String> ids, String token) async {
  try {
    Response res = await client.post(
      "$webUrl?method=song.getListData&input=3&api_version=1.0&api_token=$token",
      data: {"sng_ids": ids},
      options: Options(contentType: "application/json"),
    );
    // md5_origin is null if the login is expired
    // without the md5_origin user can't access the track
    if (res.data['results']['data'][0]['MD5_ORIGIN'] == null) {
      throw DeezerException(
        type: DeezerExceptionType.invalidToken,
        message: "Invalid token: Try to refresh the token or add new arl",
      );
    } else {
      return res;
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

// Get Favorite Songs
Future<Response> getFavoriteSongs(Dio client, String token) async {
  try {
    Response res = await client.get(
      '$webUrl?method=song.getFavoriteIds&input=3&api_version=1.0&api_token=$token',
    );
    if (res.statusCode == 200) {
      return res;
    } else {
      throw DeezerException(
        type: DeezerExceptionType.invalidResponse,
        message:
            "Invalid Responce: ${res.statusCode} and response: ${res.data}",
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

// Add Favorite Song
Future<Response> addFavoriteSong(
  Dio client,
  List<String> ids,
  String token,
) async {
  try {
    Response res = await client.post(
      '$webUrl?method=song.addFavorites&input=3&api_version=1.0&api_token=$token',
      data: {"IDS": ids},
      options: Options(contentType: "application/json"),
    );
    if (res.data['error'] is Map) {
      throw DeezerException(
        type: DeezerExceptionType.failedRequest,
        message: "Failed to add favorite song: ${res.data['error']}",
      );
    } else {
      return res;
    }
  } catch (e) {
    if (e is DioException) {
      throw DeezerException(
        type: DeezerExceptionType.network,
        message: "Network error: ${e.message}",
        error: e,
      );
    } else if (e is DeezerException) {
      rethrow;
    } else {
      throw DeezerException(
        type: DeezerExceptionType.unknown,
        message: "Unknown error: $e",
        error: e,
      );
    }
  }
}

// Remove Favorite Song
Future<Response> removeFavoriteSong(
  Dio client,
  List<String> ids,
  String token,
) async {
  try {
    Response res = await client.post(
      '$webUrl?method=song.removeFavorites&input=3&api_version=1.0&api_token=$token',
      data: {"IDS": ids},
      options: Options(contentType: "application/json"),
    );
    if (res.data['error'] is Map) {
      throw DeezerException(
        type: DeezerExceptionType.failedRequest,
        message: "Failed to remove favorite song: ${res.data['error']}",
      );
    } else {
      return res;
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

// Get Access Token
Future<String> getAccessToken(Dio client) async {
  try {
    Response response = await client.get(
      '$webUrl?api_token=null&api_version=1.0&input=3&method=deezer.getUserData',
    );
    if (response.data['results']['checkForm'] == null) {
      throw DeezerException(
        type: DeezerExceptionType.loginExpired,
        message: "Login expired add new arl",
      );
    } else {
      return response.data['results']['checkForm'];
    }
  } catch (e) {
    if (e is DioException) {
      throw DeezerException(
        type: DeezerExceptionType.network,
        message: "Network error: ${e.message}",
        error: e,
      );
    } else if (e is DeezerException) {
      rethrow;
    } else {
      throw DeezerException(
        type: DeezerExceptionType.unknown,
        message: "Unknown error: $e",
        error: e,
      );
    }
  }
}
