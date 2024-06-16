import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/models/mobile/track/user_chart_track.dart';
import 'package:deezer/src/utils/utils.dart';

class UserTrack extends UserChartTrack {
  int? timeAdd;
  String? type;

  UserTrack({
    super.id,
    super.readable,
    super.title,
    super.link,
    super.duration,
    super.rank,
    super.explicitLyrics,
    super.explicitContentLyrics,
    super.explicitContentCover,
    super.preview,
    super.md5Image,
    this.timeAdd,
    super.album,
    super.artist,
    this.type,
  });

  @override
  UserTrack copyWith({
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
    int? timeAdd,
    BaseAlbum? album,
    ArtistWithPicture? artist,
    String? type,
  }) {
    return UserTrack(
      id: id ?? this.id,
      readable: readable ?? this.readable,
      title: title ?? this.title,
      link: link ?? this.link,
      duration: duration ?? this.duration,
      rank: rank ?? this.rank,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      explicitContentLyrics:
          explicitContentLyrics ?? this.explicitContentLyrics,
      explicitContentCover: explicitContentCover ?? this.explicitContentCover,
      preview: preview ?? this.preview,
      md5Image: md5Image ?? this.md5Image,
      timeAdd: timeAdd ?? this.timeAdd,
      album: album ?? this.album,
      artist: artist ?? this.artist,
      type: type ?? this.type,
    );
  }

  factory UserTrack.fromJson(Map<String, dynamic> json) {
    return UserTrack(
      id: parseString(json['id']),
      readable: json['readable'],
      title: json['title'],
      link: json['link'],
      duration: parseInt(json['duration']),
      rank: parseInt(json['rank']),
      explicitLyrics: json['explicit_lyrics'],
      explicitContentLyrics: parseInt(json['explicit_content_lyrics']),
      explicitContentCover: parseInt(json['explicit_content_cover']),
      preview: json['preview'],
      md5Image: json['md5_image'],
      timeAdd: json['time_add'],
      album: parseJson(json['album'], (json) => BaseAlbum.fromJson(json)),
      artist: parseJson(
        json['artist'],
        (json) => ArtistWithPicture.fromJson(json),
      ),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'time_add': timeAdd,
      'type': type,
    };
  }
}

class UserTracks {
  List<UserTrack>? data;
  int? total;

  UserTracks({this.data, this.total});

  UserTracks copyWith({
    List<UserTrack>? data,
    int? total,
  }) {
    return UserTracks(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory UserTracks.fromJson(Map<String, dynamic> json) {
    return UserTracks(
      data: parseList(json['data'], (json) => UserTrack.fromJson(json)),
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
