import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/utils/utils.dart';

class ArtistAlbum extends BaseAlbum {
  int? genreId;
  int? fans;
  String? releaseDate;
  String? recordType;

  // constructor - to initialize the variables
  ArtistAlbum({
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
    this.fans,
    this.releaseDate,
    this.recordType,
    super.tracklist,
    super.type,
  });

  // CopyWith method - to create a new instance of ArtistAlbum with updated values
  @override
  ArtistAlbum copyWith({
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
    int? fans,
    String? releaseDate,
    String? recordType,
    String? tracklist,
    String? type,
  }) {
    return ArtistAlbum(
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
      fans: fans ?? this.fans,
      releaseDate: releaseDate ?? this.releaseDate,
      recordType: recordType ?? this.recordType,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory ArtistAlbum.fromJson(Map<String, dynamic> json) {
    return ArtistAlbum(
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
      fans: parseInt(json['fans']),
      releaseDate: json['release_date'],
      recordType: json['record_type'],
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'genre_id': genreId,
      'fans': fans,
      'release_date': releaseDate,
      'record_type': recordType,
    };
  }
}

class ArtistAlbums {
  List<ArtistAlbum>? data;
  int? total;

  ArtistAlbums({this.data, this.total});

  factory ArtistAlbums.fromJson(Map<String, dynamic> json) {
    return ArtistAlbums(
      data: parseList(json['data'], (i) => ArtistAlbum.fromJson(i)),
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
