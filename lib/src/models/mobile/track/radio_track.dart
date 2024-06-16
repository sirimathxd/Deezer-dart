import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/models/mobile/track/flow_track.dart';
import 'package:deezer/src/utils/utils.dart';

class RadioTrack extends FlowTrack {
  String? titleVersion;
  RadioTrack? alternative;

  RadioTrack({
    super.id,
    super.readable,
    super.title,
    super.titleShort,
    this.titleVersion,
    super.link,
    super.duration,
    super.rank,
    super.explicitLyrics,
    super.explicitContentLyrics,
    super.explicitContentCover,
    super.preview,
    this.alternative,
    super.md5Image,
    super.artist,
    super.album,
    super.type,
  });

  @override
  RadioTrack copyWith({
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
    RadioTrack? alternative,
    String? md5Image,
    ArtistWithPicture? artist,
    BaseAlbum? album,
    String? type,
  }) {
    return RadioTrack(
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
      alternative: alternative ?? this.alternative,
      md5Image: md5Image ?? this.md5Image,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      type: type ?? this.type,
    );
  }

  factory RadioTrack.fromJson(Map<String, dynamic> json) {
    return RadioTrack(
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
      alternative: parseJson(json['alternative'], (json) => RadioTrack.fromJson(json)),
      md5Image: json['md5_image'],
      artist: parseJson(json['artist'], (json) => ArtistWithPicture.fromJson(json)),
      album: parseJson(json['album'], (json) => BaseAlbum.fromJson(json)),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'title_version': titleVersion,
      'alternative': alternative?.toJson(),
    };
  }
}

class RadioTracks {
  List<RadioTrack>? data;
  int? total;

  RadioTracks({this.data, this.total});

  RadioTracks copyWith({
    List<RadioTrack>? data,
    int? total,
  }) {
    return RadioTracks(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory RadioTracks.fromJson(Map<String, dynamic> json) {
    return RadioTracks(
      data: parseList(json['data'], (json) => RadioTrack.fromJson(json)),
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
