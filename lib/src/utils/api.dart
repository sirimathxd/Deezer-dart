import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

// create an Dio client with default cookies
Dio createDioClient(String arl, CookieJar cookieJar) {
  return Dio(BaseOptions(
    baseUrl: 'https://deezer.com',
    headers: {
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      'Cookie': 'arl=$arl',
    },
  ))
    ..interceptors.add(CookieManager(cookieJar));
}

// Search for songs
Future<Response> searchSongs(Dio client, String query) async {
  try {
    return await client.get(
      'https://api.deezer.com/search/autocomplete?q=$query',
    );
  } catch (e) {
    print("Failed to search: $e");
    return Response(requestOptions: RequestOptions(path: ''));
  }
}

// Get Track info
Future<Response> trackinfo(Dio client, String id, String token) async {
  try {
    return await client.post(
      "http://www.deezer.com/ajax/gw-light.php?api_token=$token&api_version=1.0&input=3&method=deezer.pageTrack",
      data: {"sng_id": id},
      options: Options(contentType: "application/json"),
    );
  } catch (e) {
    print("Failed to get track: $e");
    return Response(requestOptions: RequestOptions(path: ''));
  }
}

// Get Tracks info
Future<Response> tracksinfo(Dio client, List<String> ids, String token) async {
  try {
    return await client.post(
      "https://www.deezer.com/ajax/gw-light.php?method=song.getListData&input=3&api_version=1.0&api_token=$token",
      data: {"sng_ids": ids},
      options: Options(contentType: "application/json"),
    );
  } catch (e) {
    print("Failed to get tracks: $e");
    return Response(requestOptions: RequestOptions(path: ''));
  }
}

// Get Favorite Songs
Future<Response> getFavoriteSongs(Dio client, String token) async {
  try {
    return await client.get(
      'https://www.deezer.com/ajax/gw-light.php?method=song.getFavoriteIds&input=3&api_version=1.0&api_token=$token',
    );
  } catch (e) {
    print("Failed to get favorite songs: $e");
    return Response(requestOptions: RequestOptions(path: ''));
  }
}

// Add Favorite Song
Future<Response> addFavoriteSong(
    Dio client, List<String> ids, String token) async {
  try {
    return await client.post(
      'https://www.deezer.com/ajax/gw-light.php?method=song.addFavorites&input=3&api_version=1.0&api_token=$token',
      data: {"IDS": ids},
      options: Options(contentType: "application/json"),
    );
  } catch (e) {
    print("Failed to add favorite song: $e");
    return Response(requestOptions: RequestOptions(path: ''));
  }
}

// Remove Favorite Song
Future<Response> removeFavoriteSong(
    Dio client, List<String> ids, String token) async {
  try {
    return await client.post(
      'https://www.deezer.com/ajax/gw-light.php?method=song.removeFavorites&input=3&api_version=1.0&api_token=$token',
      data: {"IDS": ids},
      options: Options(contentType: "application/json"),
    );
  } catch (e) {
    print("Failed to remove favorite song: $e");
    return Response(requestOptions: RequestOptions(path: ''));
  }
}

// Get Access Token
Future<String> getAccessToken(Dio client) async {
  try {
    Response response = await client.get(
      'http://www.deezer.com/ajax/gw-light.php?api_token=null&api_version=1.0&input=3&method=deezer.getUserData',
    );
    return response.data['results']['checkForm'];
  } catch (e) {
    print("Failed to get access token: $e");
    return "";
  }
}
