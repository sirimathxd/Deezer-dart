part of 'deezer.dart';

/// The [Deezer] class is the main class of the package.
/// It is used to interact with the Deezer Web API.

extension DeezerWeb on Deezer {
  // -------------------------- Web API --------------------------

  // Get Favorite Songs
  Future<Favourites?> favSongs({
    bool throwOnError = false,
  }) async {
    try {
      return Favourites.fromJson((await getFavoriteSongs(client, token)).data);
    } catch (e) {
      log("Failed to get favorite songs: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Add Favorite Songs
  Future<bool> addFavSongs(
    List<String> ids, {
    bool throwOnError = false,
  }) async {
    try {
      await addFavoriteSong(client, ids, token);
      return true;
    } catch (e) {
      log("Failed to add favorite songs: $e");
      return false;
    }
  }

  // Remove Favorite Songs
  Future<bool> removeFavSongs(
    List<String> ids, {
    bool throwOnError = false,
  }) async {
    try {
      await removeFavoriteSong(client, ids, token);
      return true;
    } catch (e) {
      log("Failed to remove favorite songs: $e");
      return false;
    }
  }

  // Get Track info
  Future<Track?> getTrack(
    String id, {
    bool throwOnError = false,
  }) async {
    try {
      return Track.fromJson((await trackinfo(client, id, token)).data);
    } catch (e) {
      log("Failed to convert track: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }

  // Get Tracks info
  Future<Tracks?> getTracks(
    List<String> ids, {
    bool throwOnError = false,
  }) async {
    try {
      return Tracks.fromJson((await tracksinfo(client, ids, token)).data);
    } catch (e) {
      log("Failed to get tracks: $e");
      if (throwOnError) {
        rethrow;
      } else {
        return null;
      }
    }
  }
}
