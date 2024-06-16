import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/chart_artist.dart';
import 'package:deezer/src/utils/utils.dart';

class ChartAlbum extends BaseAlbum {
  String? recordType;
  bool? explicitLyrics;
  int? position;
  ChartArtist? artist;

  ChartAlbum({
    super.id,
    super.title,
    super.link,
    super.share,
    super.cover,
    super.coverSmall,
    super.coverMedium,
    super.coverBig,
    super.coverXl,
    super.md5Image,
    this.recordType,
    super.tracklist,
    this.explicitLyrics,
    this.position,
    this.artist,
    super.type,
  });

  @override
  ChartAlbum copyWith({
    String? id,
    String? title,
    String? link,
    String? share,
    String? cover,
    String? coverSmall,
    String? coverMedium,
    String? coverBig,
    String? coverXl,
    String? md5Image,
    String? recordType,
    String? tracklist,
    bool? explicitLyrics,
    int? position,
    ChartArtist? artist,
    String? type,
  }) {
    return ChartAlbum(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      share: share ?? this.share,
      cover: cover ?? this.cover,
      coverSmall: coverSmall ?? this.coverSmall,
      coverMedium: coverMedium ?? this.coverMedium,
      coverBig: coverBig ?? this.coverBig,
      coverXl: coverXl ?? this.coverXl,
      md5Image: md5Image ?? this.md5Image,
      recordType: recordType ?? this.recordType,
      tracklist: tracklist ?? this.tracklist,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      position: position ?? this.position,
      artist: artist ?? this.artist,
      type: type ?? this.type,
    );
  }

  factory ChartAlbum.fromJson(Map<String, dynamic> json) {
    return ChartAlbum(
      id: parseString(json['id']),
      title: json['title'],
      link: getlink(json['link'], 'album', json['id']),
      share: getlink(json['share'], 'album', json['id']),
      cover: json['cover'],
      coverSmall: json['cover_small'],
      coverMedium: json['cover_medium'],
      coverBig: json['cover_big'],
      coverXl: json['cover_xl'],
      md5Image: json['md5_image'],
      recordType: json['record_type'],
      tracklist: json['tracklist'],
      explicitLyrics: json['explicit_lyrics'],
      position: json['position'],
      artist: parseJson(json['artist'], ChartArtist.fromJson),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'record_type': recordType,
      'explicit_lyrics': explicitLyrics,
      'position': position,
      'artist': artist?.toJson(),
    };
  }
}

class ChartAlbums {
  List<ChartAlbum>? data;
  int? total;

  ChartAlbums({this.data, this.total});

  factory ChartAlbums.fromJson(Map<String, dynamic> json) {
    return ChartAlbums(
      data: parseList(json['data'], (i) => ChartAlbum.fromJson(i)),
      total: parseTotal(json['total'], json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((i) => i.toJson()).toList(),
      'total': total,
    };
  }
}
