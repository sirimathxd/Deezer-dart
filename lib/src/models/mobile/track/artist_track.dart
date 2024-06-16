import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_role.dart';
import 'package:deezer/src/models/mobile/artist/base_artist.dart';
import 'package:deezer/src/models/mobile/track/album_track.dart';
import 'package:deezer/src/utils/utils.dart';

class ArtistTrack extends AlbumTrack {
  List<ArtistWithRole>? contributors;

  ArtistTrack({
    super.id,
    super.readable,
    super.title,
    super.titleShort,
    super.titleVersion,
    super.link,
    super.duration,
    super.rank,
    super.explicitLyrics,
    super.explicitContentLyrics,
    super.explicitContentCover,
    super.preview,
    this.contributors,
    super.md5Image,
    super.artist,
    super.album,
    super.type,
  });

  @override
  ArtistTrack copyWith({
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
    List<ArtistWithRole>? contributors,
    String? md5Image,
    BaseArtist? artist,
    BaseAlbum? album,
    String? type,
  }) {
    return ArtistTrack(
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
      contributors: contributors ?? this.contributors,
      md5Image: md5Image ?? this.md5Image,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      type: type ?? this.type,
    );
  }

  factory ArtistTrack.fromJson(Map<String, dynamic> json) {
    return ArtistTrack(
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
      contributors:
          parseList(json['contributors'], (e) => ArtistWithRole.fromJson(e)),
      md5Image: json['md5_image'],
      artist: parseJson(json['artist'], (e) => BaseArtist.fromJson(e)),
      album: parseJson(json['album'], (e) => BaseAlbum.fromJson(e)),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'contributors': contributors?.map((e) => e.toJson()).toList(),
    };
  }
}

class ArtistTracks {
  List<ArtistTrack>? data;
  int? total;

  ArtistTracks({this.data, this.total});

  ArtistTracks copyWith({
    List<ArtistTrack>? data,
    int? total,
  }) {
    return ArtistTracks(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory ArtistTracks.fromJson(Map<String, dynamic> json) {
    return ArtistTracks(
      data: parseList(json['data'], (e) => ArtistTrack.fromJson(e)),
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
