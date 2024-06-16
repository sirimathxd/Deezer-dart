import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_role.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/models/mobile/genre/album_genre.dart';
import 'package:deezer/src/models/mobile/track/album_track.dart';
import 'package:deezer/src/utils/utils.dart';

class Album extends BaseAlbum {
  String? upc;
  int? genreId;
  AlbumGenres? genres;
  String? label;
  int? nbTracks;
  int? duration;
  int? fans;
  String? releaseDate;
  String? recordType;
  bool? available;
  bool? explicitLyrics;
  int? explicitContentLyrics;
  int? explicitContentCover;
  List<ArtistWithRole>? contributors;
  ArtistWithPicture? artist;
  AlbumTracks? tracks;

  // constructor - to initialize the variables
  Album({
    super.id,
    super.title,
    this.upc,
    super.link,
    super.share,
    super.cover,
    super.coverSmall,
    super.coverMedium,
    super.coverBig,
    super.coverXl,
    super.md5Image,
    this.genreId,
    this.genres,
    this.label,
    this.nbTracks,
    this.duration,
    this.fans,
    this.releaseDate,
    this.recordType,
    this.available,
    super.tracklist,
    this.explicitLyrics,
    this.explicitContentLyrics,
    this.explicitContentCover,
    this.contributors,
    this.artist,
    super.type,
    this.tracks,
  });

  //copyWith method - to create a new instance of Album with updated values
  @override
  Album copyWith({
    String? id,
    String? title,
    String? upc,
    String? link,
    String? share,
    String? cover,
    String? coverSmall,
    String? coverMedium,
    String? coverBig,
    String? coverXl,
    String? md5Image,
    int? genreId,
    AlbumGenres? genres,
    String? label,
    int? nbTracks,
    int? duration,
    int? fans,
    String? releaseDate,
    String? recordType,
    bool? available,
    String? tracklist,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    List<ArtistWithRole>? contributors,
    ArtistWithPicture? artist,
    String? type,
    AlbumTracks? tracks,
  }) {
    return Album(
      id: id ?? this.id,
      title: title ?? this.title,
      upc: upc ?? this.upc,
      link: link ?? this.link,
      share: share ?? this.share,
      cover: cover ?? this.cover,
      coverSmall: coverSmall ?? this.coverSmall,
      coverMedium: coverMedium ?? this.coverMedium,
      coverBig: coverBig ?? this.coverBig,
      coverXl: coverXl ?? this.coverXl,
      md5Image: md5Image ?? this.md5Image,
      genreId: genreId ?? this.genreId,
      genres: genres ?? this.genres,
      label: label ?? this.label,
      nbTracks: nbTracks ?? this.nbTracks,
      duration: duration ?? this.duration,
      fans: fans ?? this.fans,
      releaseDate: releaseDate ?? this.releaseDate,
      recordType: recordType ?? this.recordType,
      available: available ?? this.available,
      tracklist: tracklist ?? this.tracklist,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      explicitContentLyrics:
          explicitContentLyrics ?? this.explicitContentLyrics,
      explicitContentCover: explicitContentCover ?? this.explicitContentCover,
      contributors: contributors ?? this.contributors,
      artist: artist ?? this.artist,
      type: type ?? this.type,
      tracks: tracks ?? this.tracks,
    );
  }

  //fromJson method - to convert json object to Album object
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: parseString(json['id']),
      title: json['title'],
      upc: json['upc'],
      link: getlink(json['link'], 'album', json['id']),
      share: getlink(json['share'], 'album', json['id']),
      cover: json['cover'],
      coverSmall: json['cover_small'],
      coverMedium: json['cover_medium'],
      coverBig: json['cover_big'],
      coverXl: json['cover_xl'],
      md5Image: json['md5_image'],
      genreId: parseInt(json['genre_id']),
      genres: parseJson(json['genres'], (i) => AlbumGenres.fromJson(i)),
      label: json['label'],
      nbTracks: parseInt(json['nb_tracks']),
      duration: parseInt(json['duration']),
      fans: parseInt(json['fans']),
      releaseDate: json['release_date'],
      recordType: json['record_type'],
      available: json['available'],
      tracklist: json['tracklist'],
      explicitLyrics: json['explicit_lyrics'],
      explicitContentLyrics: json['explicit_content_lyrics'],
      explicitContentCover: json['explicit_content_cover'],
      contributors: parseList(json['contributors'], (i) => ArtistWithRole.fromJson(i)),
      artist: parseJson(json['artist'], (i) => ArtistWithPicture.fromJson(i)),
      type: json['type'],
      tracks: parseJson(json['tracks'], (i) => AlbumTracks.fromJson(i)),
    );
  }

  @override //toJson method - to convert Album object to json object
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(), //spread operator
      'upc': upc,
      'genre_id': genreId,
      'genres': genres?.toJson(),
      'label': label,
      'nb_tracks': nbTracks,
      'duration': duration,
      'fans': fans,
      'release_date': releaseDate,
      'record_type': recordType,
      'available': available,
      'explicit_lyrics': explicitLyrics,
      'explicit_content_lyrics': explicitContentLyrics,
      'explicit_content_cover': explicitContentCover,
      'contributors': contributors?.map((i) => i.toJson()).toList(),
      'artist': artist?.toJson(),
      'tracks': tracks?.toJson(),
    };
  }
}
