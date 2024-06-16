enum ALBUM {
  details, // Get album details
  tracks, // Get album tracks
}

enum ARTIST {
  details, // Get artist details
  topTracks, // Get artist top tracks
  albums, // Get artist albums
  relatedArtists, // Get related artists
  radios, // Get list of tracks
  playlists, // Get artist playlists
}

enum CHART {
  all, // Get top tracks, albums, artists, playlists, podcasts (mixed genre)
  topTracks, // Get top tracks
  topAlbums, // Get top albums
  topArtists, // Get top artists
  topPlaylists, // Get top playlists
  topPodcasts, // Get top podcasts
}

enum EDITORIALS {
  all, // list of all editorial
  details, // Get editorial details
}

enum GENRE {
  all, // list of all genres
  details, // Get genre details
  artists, // list of artists for a genre
  radios, // list of radios for a genre
}

enum PLAYLIST {
  details, // Get playlist details
  tracks, // Get playlist tracks
}

enum RADIO {
  radios, // list of radios
  tracks, // Get first 40 tracks in the radio
  genres, // list of radio splitted by genre
  top, // list of  top radios (default to 25 radios)
  list, // list of personal radio splitted by genre (as MIX in website)
}

enum SEARCH {
  album, // search for albums
  artist, // search for artists
  playlist, // search for playlists
  track, // search for tracks
  user, // search for users
  radio, // search for radios
  // advandced, // advanced search
}
// Example of advanced search
// https://api.deezer.com/search?q=track:"i need a dollar"
// https://api.deezer.com/search?q=artist:"aloe blacc" track:"i need a dollar"
// https://api.deezer.com/search?q=bpm_min:120 dur_min:300

enum USER {
  details, // Get user details
  albums, // Get user albums
  artists, // Get user artists
  chartsTracks, // Get list of tracks
  chartsAlbums, // Get list of albums
  chartsArtists, // Get list of artists
  chartsPlaylists, // Get list of playlists
  flow, // Get list of user's flow tracks,
  followings, // Get list of user's friends
  followers, // Get list of user's followers
  playlists, // Get list of user's playlists (public)
  radios, // Get list of user's favorite Radios
  tracks, // Get list of user's favorite tracks
}

T? parseJson<T>(dynamic json, T Function(Map<String, dynamic>) fromJson) {
  if (json == null) {
    return null;
  }
  if (json is Map<String, dynamic>) {
    return fromJson(json);
  }
  throw ArgumentError('Invalid type for json field: ${json.runtimeType}');
}

int? parseInt(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is String) {
    return int.tryParse(value);
  }
  if (value is int) {
    return value;
  }
  throw ArgumentError('Invalid type for int field: ${value.runtimeType}');
}

String? parseString(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is String) {
    return value;
  }
  if (value is int) {
    return value.toString();
  }
  throw ArgumentError('Invalid type for string field: ${value.runtimeType}');
}

String getlink(String? url, String typ, dynamic id) {
  if (url == null) {
    return 'https://www.deezer.com/$typ/$id';
  }
  return url;
}

int parseTotal(dynamic value, List<dynamic>? dataList) {
  if (value != null) {
    return value;
  }
  return dataList?.length ?? 0;
}

List<T>? parseList<T>(dynamic value, T Function(dynamic) fromJson) {
  if (value == null) {
    return null;
  }
  if (value is List) {
    return value.map(fromJson).toList();
  }
  throw ArgumentError('Invalid type for list field: ${value.runtimeType}');
}
