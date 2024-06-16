import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/chart_artist.dart';
import 'package:deezer/src/models/mobile/track/base_track.dart';
import 'package:deezer/src/utils/utils.dart';

class ChartTrack extends BaseTrack {
  String? titleShort;
  String? titleVersion;
  String? position;
  ChartArtist? artist;
  BaseAlbum? album;

  ChartTrack({
    super.id,
    super.title,
    this.titleShort,
    this.titleVersion,
    super.link,
    super.duration,
    super.rank,
    super.explicitLyrics,
    super.explicitContentLyrics,
    super.explicitContentCover,
    super.preview,
    super.md5Image,
    this.position,
    this.artist,
    this.album,
  });

  @override
  ChartTrack copyWith({
    String? id,
    String? title,
    String? titleShort,
    String? titleVersion,
    String? link,
    int? duration,
    int? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
    String? position,
    ChartArtist? artist,
    BaseAlbum? album,
  }) {
    return ChartTrack(
      id: id ?? this.id,
      title: title ?? this.title,
      titleShort: titleShort ?? this.titleShort,
      titleVersion: titleVersion ?? this.titleVersion,
      link: link ?? this.link,
      duration: duration ?? this.duration,
      rank: rank ?? this.rank,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      explicitContentLyrics:
          explicitContentLyrics ?? this.explicitContentLyrics,
      explicitContentCover: explicitContentCover ?? this.explicitContentCover,
      preview: preview ?? this.preview,
      md5Image: md5Image ?? this.md5Image,
      position: position ?? this.position,
      artist: artist ?? this.artist,
      album: album ?? this.album,
    );
  }

  factory ChartTrack.fromJson(Map<String, dynamic> json) {
    return ChartTrack(
      id: parseString(json['id']),
      title: json['title'],
      titleShort: json['title_short'],
      titleVersion: json['title_version'],
      link: getlink(json['link'], 'track', json['id']),
      duration: parseInt(json['duration']),
      rank: parseInt(json['rank']),
      explicitLyrics: json['explicit_lyrics'],
      explicitContentLyrics: parseInt(json['explicit_content_lyrics']),
      explicitContentCover: parseInt(json['explicit_content_cover']),
      preview: json['preview'],
      md5Image: json['md5_image'],
      position: parseString(json['position']),
      artist: parseJson(json['artist'], (json) => ChartArtist.fromJson(json)),
      album: parseJson(json['album'], (json) => BaseAlbum.fromJson(json)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'title_short': titleShort,
      'title_version': titleVersion,
      'position': position,
      'artist': artist?.toJson(),
      'album': album?.toJson(),
    };
  }
}

class ChartTracks {
  List<ChartTrack>? data;
  int? total;

  ChartTracks({
    this.data,
    this.total,
  });

  factory ChartTracks.fromJson(Map<String, dynamic> json) {
    return ChartTracks(
      data: parseList(json['data'], (json) => ChartTrack.fromJson(json)),
      total: parseTotal(json['total'], json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}
