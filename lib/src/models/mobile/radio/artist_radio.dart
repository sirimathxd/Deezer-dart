import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/utils/utils.dart';

class ArtistRadio {
  String? id;
  bool? readable;
  String? title;
  String? titleShort;
  String? titleVersion;
  String? duration;
  String? rank;
  bool? explicitLyrics;
  int? explicitContentLyrics;
  int? explicitContentCover;
  String? preview;
  String? md5Image;
  ArtistWithPicture? artist;
  BaseAlbum? album;
  String? type;

  ArtistRadio({
    this.id,
    this.readable,
    this.title,
    this.titleShort,
    this.titleVersion,
    this.duration,
    this.rank,
    this.explicitLyrics,
    this.explicitContentLyrics,
    this.explicitContentCover,
    this.preview,
    this.md5Image,
    this.artist,
    this.album,
    this.type,
  });

  ArtistRadio copyWith({
    String? id,
    bool? readable,
    String? title,
    String? titleShort,
    String? titleVersion,
    String? duration,
    String? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
    ArtistWithPicture? artist,
    BaseAlbum? album,
    String? type,
  }) {
    return ArtistRadio(
      id: id ?? this.id,
      readable: readable ?? this.readable,
      title: title ?? this.title,
      titleShort: titleShort ?? this.titleShort,
      titleVersion: titleVersion ?? this.titleVersion,
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

  factory ArtistRadio.fromJson(Map<String, dynamic> json) {
    return ArtistRadio(
      id: parseString(json['id']),
      readable: json['readable'],
      title: json['title'],
      titleShort: json['title_short'],
      titleVersion: json['title_version'],
      duration: parseString(json['duration']),
      rank: parseString(json['rank']),
      explicitLyrics: json['explicit_lyrics'],
      explicitContentLyrics: parseInt(json['explicit_content_lyrics']),
      explicitContentCover: parseInt(json['explicit_content_cover']),
      preview: json['preview'],
      md5Image: json['md5_image'],
      artist: parseJson(json['artist'], (json) => ArtistWithPicture.fromJson(json),),
      album: parseJson(json['album'], (json) => BaseAlbum.fromJson(json),),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'readable': readable,
      'title': title,
      'title_short': titleShort,
      'title_version': titleVersion,
      'duration': duration,
      'rank': rank,
      'explicit_lyrics': explicitLyrics,
      'explicit_content_lyrics': explicitContentLyrics,
      'explicit_content_cover': explicitContentCover,
      'preview': preview,
      'md5_image': md5Image,
      'artist': artist?.toJson(),
      'album': album?.toJson(),
      'type': type,
    };
  }
}

class ArtistRadios {
  List<ArtistRadio>? data;
  int? total;

  ArtistRadios({
    this.data,
    this.total,
  });

  ArtistRadios copyWith({
    List<ArtistRadio>? data,
    int? total,
  }) {
    return ArtistRadios(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory ArtistRadios.fromJson(Map<String, dynamic> json) {
    return ArtistRadios(
      data: parseList(json['data'], (json) => ArtistRadio.fromJson(json)),
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
