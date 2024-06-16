import 'package:deezer/src/models/mobile/album/base_album.dart';
import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/utils/utils.dart';

class UserAlbum extends BaseAlbum {
  int? nbTracks;
  String? releaseDate;
  String? recordType;
  bool? available;
  bool? explicitLyrics;
  int? timeAdd;
  ArtistWithPicture? artist;

  UserAlbum({
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
    this.nbTracks,
    this.releaseDate,
    this.recordType,
    this.available,
    super.tracklist,
    this.explicitLyrics,
    this.timeAdd,
    this.artist,
    super.type,
  });

  @override
  UserAlbum copyWith({
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
    int? nbTracks,
    String? releaseDate,
    String? recordType,
    bool? available,
    bool? explicitLyrics,
    int? timeAdd,
    ArtistWithPicture? artist,
    String? tracklist,
    String? type,
  }) {
    return UserAlbum(
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
      nbTracks: nbTracks ?? this.nbTracks,
      releaseDate: releaseDate ?? this.releaseDate,
      recordType: recordType ?? this.recordType,
      available: available ?? this.available,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      timeAdd: timeAdd ?? this.timeAdd,
      artist: artist ?? this.artist,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory UserAlbum.fromJson(Map<String, dynamic> json) {
    return UserAlbum(
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
      nbTracks: parseInt(json['nb_tracks']),
      releaseDate: json['release_date'],
      recordType: json['record_type'],
      available: json['available'],
      tracklist: json['tracklist'],
      explicitLyrics: json['explicit_lyrics'],
      timeAdd: parseInt(json['time_add']),
      artist: parseJson(
        json['artist'],
        (data) => ArtistWithPicture.fromJson(data),
      ),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'nb_tracks': nbTracks,
      'release_date': releaseDate,
      'record_type': recordType,
      'available': available,
      'explicit_lyrics': explicitLyrics,
      'time_add': timeAdd,
      'artist': artist?.toJson(),
    };
  }
}

class UserAlbums {
  List<UserAlbum>? data;
  int? total;

  UserAlbums({this.data, this.total});

  factory UserAlbums.fromJson(Map<String, dynamic> json) {
    return UserAlbums(
      data: parseList(json['data'], (i) => UserAlbum.fromJson(i)),
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
