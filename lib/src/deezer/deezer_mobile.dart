part of 'deezer.dart';

/// The [Deezer] class is the main class of the package.
/// This extension contains all the mobile API functions.
/// It is used to convert the JSON response from the API to Dart objects.

extension DeezerMobile on Deezer {
  // ------- Album API -------

  // Get Album details
  Future<Album?> getAlbum(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Album.fromJson(
        (await get(client, getAlbumPath(ALBUM.details, id))).data,
      );
    } catch (e) {
      log("Failed to get album: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Album tracks
  Future<AlbumTracks?> getAlbumTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return AlbumTracks.fromJson(
        (await get(client, getAlbumPath(ALBUM.tracks, id))).data,
      );
    } catch (e) {
      log("Failed to get album tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Artist API -------

  // Get Artist details
  Future<Artist?> getArtist(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Artist.fromJson(
        (await get(client, getArtistPath(ARTIST.details, id))).data,
      );
    } catch (e) {
      log("Failed to get artist: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Artist top tracks
  Future<ArtistTracks?> getArtistTopTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ArtistTracks.fromJson(
        (await get(client, getArtistPath(ARTIST.topTracks, id))).data,
      );
    } catch (e) {
      log("Failed to get artist top tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Artist albums
  Future<ArtistAlbums?> getArtistAlbums(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ArtistAlbums.fromJson(
        (await get(client, getArtistPath(ARTIST.albums, id))).data,
      );
    } catch (e) {
      log("Failed to get artist albums: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Artist related artists
  Future<Artists?> getArtistRelated(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Artists.fromJson(
        (await get(client, getArtistPath(ARTIST.relatedArtists, id))).data,
      );
    } catch (e) {
      log("Failed to get artist related artists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Artist radios
  Future<ArtistRadios?> getArtistRadios(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ArtistRadios.fromJson(
        (await get(client, getArtistPath(ARTIST.radios, id))).data,
      );
    } catch (e) {
      log("Failed to get artist radios: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Artist playlists
  Future<ArtistPlaylists?> getArtistPlaylists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ArtistPlaylists.fromJson(
        (await get(client, getArtistPath(ARTIST.playlists, id))).data,
      );
    } catch (e) {
      log("Failed to get artist playlists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Chart API -------
  // Get Chart
  Future<Chart?> getChart(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Chart.fromJson(
        (await get(client, getChartPath(CHART.all, id))).data,
      );
    } catch (e) {
      log("Failed to get chart: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Chart top tracks
  Future<ChartTracks?> getChartTopTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartTracks.fromJson(
        (await get(client, getChartPath(CHART.topTracks, id))).data,
      );
    } catch (e) {
      log("Failed to get chart top tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Chart top albums
  Future<ChartAlbums?> getChartTopAlbums(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartAlbums.fromJson(
        (await get(client, getChartPath(CHART.topAlbums, id))).data,
      );
    } catch (e) {
      log("Failed to get chart top albums: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Chart top artists
  Future<ChartArtists?> getChartTopArtists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartArtists.fromJson(
        (await get(client, getChartPath(CHART.topArtists, id))).data,
      );
    } catch (e) {
      log("Failed to get chart top artists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Chart top playlists
  Future<ChartPlaylists?> getChartTopPlaylists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartPlaylists.fromJson(
        (await get(client, getChartPath(CHART.topPlaylists, id))).data,
      );
    } catch (e) {
      log("Failed to get chart top playlists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Chart top podcasts
  Future<ChartPodcasts?> getChartTopPodcasts(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartPodcasts.fromJson(
        (await get(client, getChartPath(CHART.topPodcasts, id))).data,
      );
    } catch (e) {
      log("Failed to get chart top podcasts: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Editorial API -------

  // Get Editorials
  Future<Genres?> getEditorials({
    bool throwOnError = false,
  }) async {
    try {
      return Genres.fromJson(
        (await get(client, getEditorialPath(EDITORIALS.all, ""))).data,
      );
    } catch (e) {
      log("Failed to get editorials: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Editorial details
  Future<Genre?> getEditorial(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Genre.fromJson(
        (await get(client, getEditorialPath(EDITORIALS.details, id))).data,
      );
    } catch (e) {
      log("Failed to get editorial: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Genre API -------

  // Get Genres
  Future<Genres?> getGenres({
    bool throwOnError = false,
  }) async {
    try {
      return Genres.fromJson(
        (await get(client, getGenrePath(GENRE.all, ""))).data,
      );
    } catch (e) {
      log("Failed to get genres: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Genre details
  Future<Genre?> getGenre(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Genre.fromJson(
        (await get(client, getGenrePath(GENRE.details, id))).data,
      );
    } catch (e) {
      log("Failed to get genre: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Genre artists
  Future<ChartArtists?> getGenreArtists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartArtists.fromJson(
        (await get(client, getGenrePath(GENRE.artists, id))).data,
      );
    } catch (e) {
      log("Failed to get genre artists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Genre radios
  Future<Radios?> getGenreRadios(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Radios.fromJson(
        (await get(client, getGenrePath(GENRE.radios, id))).data,
      );
    } catch (e) {
      log("Failed to get genre radios: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Playlist API -------

  // Get Playlist details
  Future<Playlist?> getPlaylist(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Playlist.fromJson(
        (await get(client, getPlaylistPath(PLAYLIST.details, id))).data,
      );
    } catch (e) {
      log("Failed to get playlist: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Playlist tracks
  Future<PlaylistTracks?> getPlaylistTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return PlaylistTracks.fromJson(
        (await get(client, getPlaylistPath(PLAYLIST.tracks, id))).data,
      );
    } catch (e) {
      log("Failed to get playlist tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Radio API -------

  // Get Radio details
  Future<Radio?> getRadio(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Radio.fromJson(
        (await get(client, getRadioPath(RADIO.radios, id))).data,
      );
    } catch (e) {
      log("Failed to get radio: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Radio tracks
  Future<RadioTracks?> getRadioTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return RadioTracks.fromJson(
        (await get(client, getRadioPath(RADIO.tracks, id))).data,
      );
    } catch (e) {
      log("Failed to get radio tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Radio genres
  Future<RadioGenres?> getRadioGenres(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return RadioGenres.fromJson(
        (await get(client, getRadioPath(RADIO.genres, id))).data,
      );
    } catch (e) {
      log("Failed to get radio genres: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Radio top
  Future<Radios?> getRadioTop(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Radios.fromJson(
        (await get(client, getRadioPath(RADIO.top, id))).data,
      );
    } catch (e) {
      log("Failed to get radio top: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Radio list
  Future<Radios?> getRadioList(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Radios.fromJson(
        (await get(client, getRadioPath(RADIO.list, id))).data,
      );
    } catch (e) {
      log("Failed to get radio list: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- Search API -------

  // Search for albums
  Future<SearchAlbums?> searchAlbums(String query, {
    bool throwOnError = false,
  }) async {
    try {
      return SearchAlbums.fromJson(
        (await get(client, getSearchPath(SEARCH.album, query))).data,
      );
    } catch (e) {
      log("Failed to search albums: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Search for artists
  Future<Artists?> searchArtists(String query, {
    bool throwOnError = false,
  }) async {
    try {
      return Artists.fromJson(
        (await get(client, getSearchPath(SEARCH.artist, query))).data,
      );
    } catch (e) {
      log("Failed to search artists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Search for playlists
  Future<ChartPlaylists?> searchPlaylists(String query, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartPlaylists.fromJson(
        (await get(client, getSearchPath(SEARCH.playlist, query))).data,
      );
    } catch (e) {
      log("Failed to search playlists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }


  // Search for tracks
  Future<AlbumTracks?> searchTracks(
    String query, {
    bool throwOnError = false,
  }) async {
    try {
      return AlbumTracks.fromJson(
        (await get(client, getSearchPath(SEARCH.track, query))).data,
      );
    } catch (e) {
      log("Failed to search tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
      }
    }
  }

  // Search for users
  Future<UsersWithPic?> searchUsers(String query, {
    bool throwOnError = false,
  }) async {
    try {
      return UsersWithPic.fromJson(
        (await get(client, getSearchPath(SEARCH.user, query))).data,
      );
    } catch (e) {
      log("Failed to search users: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Search for radios
  Future<Radios?> searchRadios(String query, {
    bool throwOnError = false,
  }) async {
    try {
      return Radios.fromJson(
        (await get(client, getSearchPath(SEARCH.radio, query))).data,
      );
    } catch (e) {
      log("Failed to search radios: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // ------- User API -------

  // Get User details
  Future<User?> getUser(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return User.fromJson(
        (await get(client, getUserPath(USER.details, id))).data,
      );
    } catch (e) {
      log("Failed to get user: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User albums
  Future<UserAlbums?> getUserAlbums(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UserAlbums.fromJson(
        (await get(client, getUserPath(USER.albums, id))).data,
      );
    } catch (e) {
      log("Failed to get user albums: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User artists
  Future<UserArtists?> getUserArtists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UserArtists.fromJson(
        (await get(client, getUserPath(USER.artists, id))).data,
      );
    } catch (e) {
      log("Failed to get user artists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User tracks
  Future<UserTracks?> getUserTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UserTracks.fromJson(
        (await get(client, getUserPath(USER.tracks, id))).data,
      );
    } catch (e) {
      log("Failed to get user tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User radios
  Future<Radios?> getUserRadios(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Radios.fromJson(
        (await get(client, getUserPath(USER.radios, id))).data,
      );
    } catch (e) {
      log("Failed to get user radios: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User chart tracks
  Future<UserChartTracks?> getUserChartTracks(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UserChartTracks.fromJson(
        (await get(client, getUserPath(USER.chartsTracks, id))).data,
      );
    } catch (e) {
      log("Failed to get user chart tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User chart albums
  Future<SearchAlbums?> getUserChartAlbums(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return SearchAlbums.fromJson(
        (await get(client, getUserPath(USER.chartsAlbums, id))).data,
      );
    } catch (e) {
      log("Failed to get user chart albums: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User chart artists
  Future<Artists?> getUserChartArtists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Artists.fromJson(
        (await get(client, getUserPath(USER.chartsArtists, id))).data,
      );
    } catch (e) {
      log("Failed to get user chart artists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User chart playlists
  Future<ChartPlaylists?> getUserChartPlaylists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return ChartPlaylists.fromJson(
        (await get(client, getUserPath(USER.chartsPlaylists, id))).data,
      );
    } catch (e) {
      log("Failed to get user chart playlists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User flow
  Future<FlowTracks?> getUserFlow(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return FlowTracks.fromJson(
        (await get(client, getUserPath(USER.flow, id))).data,
      );
    } catch (e) {
      log("Failed to get user flow: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User followings
  Future<UsersWithPic?> getUserFollowings(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UsersWithPic.fromJson(
        (await get(client, getUserPath(USER.followings, id))).data,
      );
    } catch (e) {
      log("Failed to get user followings: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User followers
  Future<UsersWithPic?> getUserFollowers(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UsersWithPic.fromJson(
        (await get(client, getUserPath(USER.followers, id))).data,
      );
    } catch (e) {
      log("Failed to get user followers: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get User playlists
  Future<UserPlaylists?> getUserPlaylists(String id, {
    bool throwOnError = false,
  }) async {
    try {
      return UserPlaylists.fromJson(
        (await get(client, getUserPath(USER.playlists, id))).data,
      );
    } catch (e) {
      log("Failed to get user playlists: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }
}
