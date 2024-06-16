import 'package:deezer/src/models/mobile/album/chart_album.dart';
import 'package:deezer/src/models/mobile/artist/chart_artist.dart';
import 'package:deezer/src/models/mobile/playlist/chart_playlist.dart';
import 'package:deezer/src/models/mobile/podcasts/podcasts.dart';
import 'package:deezer/src/models/mobile/track/chart_track.dart';
import 'package:deezer/src/utils/utils.dart';

class Chart {
  ChartTracks? tracks;
  ChartAlbums? albums;
  ChartArtists? artists;
  ChartPlaylists? playlists;
  ChartPodcasts? podcasts;

  Chart({
    this.tracks,
    this.albums,
    this.artists,
    this.playlists,
    this.podcasts,
  });

  factory Chart.fromJson(Map<String, dynamic> json) {
    return Chart(
      tracks: parseJson(
        json['tracks'],
        (json) => ChartTracks.fromJson(json),
      ),
      albums: parseJson(
        json['albums'],
        (json) => ChartAlbums.fromJson(json),
      ),
      artists: parseJson(
        json['artists'],
        (json) => ChartArtists.fromJson(json),
      ),
      playlists: parseJson(
        json['playlists'],
        (json) => ChartPlaylists.fromJson(json),
      ),
      podcasts: parseJson(
        json['podcasts'],
        (json) => ChartPodcasts.fromJson(json),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tracks': tracks?.toJson(),
      'albums': albums?.toJson(),
      'artists': artists?.toJson(),
      'playlists': playlists?.toJson(),
      'podcasts': podcasts?.toJson(),
    };
  }
}
