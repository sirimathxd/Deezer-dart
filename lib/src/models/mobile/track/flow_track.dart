import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/models/mobile/track/user_chart_track.dart';
import 'package:deezer/src/utils/utils.dart';

class FlowTrack extends UserChartTrack {
  String? titleShort;
  String? type;

  FlowTrack({
    super.id,
    super.readable,
    super.title,
    super.link,
    this.titleShort,
    super.duration,
    super.rank,
    super.explicitLyrics,
    super.explicitContentLyrics,
    super.explicitContentCover,
    super.preview,
    super.md5Image,
    super.artist,
    super.album,
    this.type,
  });

  @override
  FlowTrack copyWith({
    String? id,
    bool? readable,
    String? title,
    String? link,
    String? titleShort,
    int? duration,
    int? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
    ArtistWithPicture? artist,
    BaseAlbum? album,
    String? type,
  }) {
    return FlowTrack(
      id: id ?? this.id,
      readable: readable ?? this.readable,
      title: title ?? this.title,
      titleShort: titleShort ?? this.titleShort,
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

  factory FlowTrack.fromJson(Map<String, dynamic> json) {
    return FlowTrack(
      id: parseString(json['id']),
      readable: json['readable'],
      title: json['title'],
      link: getlink(json['link'], 'track', json['id']),
      titleShort: json['title_short'],
      duration: parseInt(json['duration']),
      rank: parseInt(json['rank']),
      explicitLyrics: json['explicit_lyrics'],
      explicitContentLyrics: parseInt(json['explicit_content_lyrics']),
      explicitContentCover: parseInt(json['explicit_content_cover']),
      preview: json['preview'],
      md5Image: json['md5_image'],
      artist: parseJson(
        json['artist'],
        (json) => ArtistWithPicture.fromJson(json),
      ),
      album: parseJson(
        json['album'],
        (json) => BaseAlbum.fromJson(json),
      ),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'title_short': titleShort,
      'type': type,
    };
  }
}

class FlowTracks {
  List<FlowTrack>? data;
  int? total;

  FlowTracks({
    this.data,
    this.total,
  });

  FlowTracks copyWith({
    List<FlowTrack>? data,
    int? total,
  }) {
    return FlowTracks(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory FlowTracks.fromJson(Map<String, dynamic> json) {
    return FlowTracks(
      data: parseList(json['data'], (json) => FlowTrack.fromJson(json)),
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
