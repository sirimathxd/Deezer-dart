import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/models/mobile/track/base_track.dart';
import 'package:deezer/src/utils/utils.dart';

class UserChartTrack extends BaseTrack {
  bool? readable;
  ArtistWithPicture? artist;
  BaseAlbum? album;

  UserChartTrack({
    super.id,
    this.readable,
    super.title,
    super.link,
    super.duration,
    super.rank,
    super.explicitLyrics,
    super.explicitContentLyrics,
    super.explicitContentCover,
    super.preview,
    super.md5Image,
    this.artist,
    this.album,
  });

  @override
  UserChartTrack copyWith({
    String? id,
    bool? readable,
    String? title,
    String? link,
    int? duration,
    int? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
    ArtistWithPicture? artist,
    BaseAlbum? album,
  }) {
    return UserChartTrack(
      id: id ?? this.id,
      readable: readable ?? this.readable,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      rank: rank ?? this.rank,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      explicitContentLyrics:
          explicitContentLyrics ?? this.explicitContentLyrics,
      explicitContentCover: explicitContentCover ?? this.explicitContentCover,
      preview: preview ?? this.preview,
      md5Image: md5Image ?? this.md5Image,
      artist: artist ?? this.artist,
      album: album ?? this.album,
    );
  }

  factory UserChartTrack.fromJson(Map<String, dynamic> json) {
    return UserChartTrack(
      id: parseString(json['id']),
      readable: json['readable'],
      title: json['title'],
      duration: parseInt(json['duration']),
      rank: parseInt(json['rank']),
      explicitLyrics: json['explicit_lyrics'],
      explicitContentLyrics: parseInt(json['explicit_content_lyrics']),
      explicitContentCover: parseInt(json['explicit_content_cover']),
      preview: json['preview'],
      md5Image: json['md5_image'],
      artist: parseJson(json['artist'], (json) => ArtistWithPicture.fromJson(json)),
      album: parseJson(json['album'], (json) => BaseAlbum.fromJson(json)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'readable': readable,
      'artist': artist?.toJson(),
      'album': album?.toJson(),
    };
  }
}

class UserChartTracks {
  List<UserChartTrack>? data;
  int? total;

  UserChartTracks({this.data, this.total});

  UserChartTracks copyWith({
    List<UserChartTrack>? data,
    int? total,
  }) {
    return UserChartTracks(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory UserChartTracks.fromJson(Map<String, dynamic> json) {
    return UserChartTracks(
      data: parseList(json['data'], (json) => UserChartTrack.fromJson(json)),
      total: parseTotal(json['total'], json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}
