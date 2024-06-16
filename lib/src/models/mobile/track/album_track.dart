import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/base_artist.dart';
import 'package:deezer/src/models/mobile/track/base_track.dart';
import 'package:deezer/src/utils/utils.dart';

class AlbumTrack extends BaseTrack {
  bool? readable;
  String? titleShort;
  String? titleVersion;
  BaseArtist? artist;
  BaseAlbum? album;
  String? type;

  AlbumTrack({
    super.id,
    this.readable,
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
    this.artist,
    this.album,
    this.type,
  });

  @override
  AlbumTrack copyWith({
    String? id,
    bool? readable,
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
    BaseArtist? artist,
    BaseAlbum? album,
    String? type,
  }) {
    return AlbumTrack(
      id: id ?? this.id,
      readable: readable ?? this.readable,
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
      artist: artist ?? this.artist,
      album: album ?? this.album,
      type: type ?? this.type,
    );
  }

  factory AlbumTrack.fromJson(Map<String, dynamic> json) {
    return AlbumTrack(
      id: parseString(json['id']),
      readable: json['readable'],
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
      artist: parseJson(json['artist'], BaseArtist.fromJson),
      album: parseJson(json['album'], BaseAlbum.fromJson),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
    };
  }
}

class AlbumTracks {
  List<AlbumTrack>? data;
  int? total;

  AlbumTracks({this.data, this.total});

  AlbumTracks copyWith({
    List<AlbumTrack>? data,
    int? total,
  }) {
    return AlbumTracks(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory AlbumTracks.fromJson(Map<String, dynamic> json) {
    // print("AlbumTracks.fromJson: $json");
    return AlbumTracks(
      data: parseList(json['data'], (e) => AlbumTrack.fromJson(e)),
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
