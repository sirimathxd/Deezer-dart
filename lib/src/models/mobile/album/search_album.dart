import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/utils/utils.dart';

class SearchAlbum extends BaseAlbum {
  int? genreId;
  int? nbTracks;
  String? recordType;
  bool? explicitLyrics;
  ArtistWithPicture? artist;

  SearchAlbum({
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
    this.genreId,
    this.nbTracks,
    this.recordType,
    super.tracklist,
    this.explicitLyrics,
    this.artist,
    super.type,
  });

  @override
  SearchAlbum copyWith({
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
    int? genreId,
    int? nbTracks,
    String? recordType,
    String? tracklist,
    bool? explicitLyrics,
    ArtistWithPicture? artist,
    String? type,
  }) {
    return SearchAlbum(
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
      genreId: genreId ?? this.genreId,
      nbTracks: nbTracks ?? this.nbTracks,
      recordType: recordType ?? this.recordType,
      tracklist: tracklist ?? this.tracklist,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      artist: artist ?? this.artist,
      type: type ?? this.type,
    );
  }

  factory SearchAlbum.fromJson(Map<String, dynamic> json) {
    return SearchAlbum(
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
      genreId: parseInt(json['genre_id']),
      nbTracks: parseInt(json['nb_tracks']),
      recordType: json['record_type'],
      tracklist: json['tracklist'],
      explicitLyrics: json['explicit_lyrics'],
      artist: parseJson(json['artist'], (i) => ArtistWithPicture.fromJson(i)),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'genre_id': genreId,
      'nb_tracks': nbTracks,
      'record_type': recordType,
      'explicit_lyrics': explicitLyrics,
      'artist': artist?.toJson(),
    };
  }
}

class SearchAlbums {
  List<SearchAlbum>? data;
  int? total;
  String? next;

  SearchAlbums({this.data, this.total, this.next});

  factory SearchAlbums.fromJson(Map<String, dynamic> json) {
    return SearchAlbums(
      data: parseList(json['data'], (i) => SearchAlbum.fromJson(i)),
      total: parseTotal(json['total'], json['data']),
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((i) => i.toJson()).toList(),
      'total': total,
      'next': next,
    };
  }
}
