import 'package:deezer/src/models/mobile/playlist/base_playlist.dart';
import 'package:deezer/src/models/mobile/user/base_user.dart';
import 'package:deezer/src/utils/utils.dart';

class ArtistPlaylist extends BasePlaylist {
  BaseUser? user;

  ArtistPlaylist({
    super.id,
    super.title,
    super.public,
    super.link,
    super.share,
    super.picture,
    super.pictureSmall,
    super.pictureMedium,
    super.pictureBig,
    super.pictureXl,
    super.checksum,
    super.tracklist,
    super.creationDate,
    super.md5Image,
    super.pictureType,
    this.user,
    super.type,
  });

  @override
  ArtistPlaylist copyWith({
    String? id,
    String? title,
    bool? public,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? checksum,
    String? tracklist,
    String? creationDate,
    String? md5Image,
    String? pictureType,
    BaseUser? user,
    String? type,
  }) {
    return ArtistPlaylist(
      id: id ?? this.id,
      title: title ?? this.title,
      public: public ?? this.public,
      link: link ?? this.link,
      share: share ?? this.share,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      checksum: checksum ?? this.checksum,
      tracklist: tracklist ?? this.tracklist,
      creationDate: creationDate ?? this.creationDate,
      md5Image: md5Image ?? this.md5Image,
      pictureType: pictureType ?? this.pictureType,
      user: user ?? this.user,
      type: type ?? this.type,
    );
  }

  factory ArtistPlaylist.fromJson(Map<String, dynamic> json) {
    return ArtistPlaylist(
      id: parseString(json['id']),
      title: json['title'],
      public: json['public'],
      link: getlink(json['link'], 'playlist', json['id']),
      share: getlink(json['share'], 'playlist', json['id']),
      picture: json['picture'],
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      checksum: json['checksum'],
      tracklist: json['tracklist'],
      creationDate: json['creation_date'],
      md5Image: json['md5_image'],
      pictureType: json['picture_type'],
      user: parseJson(json['user'], (json) => BaseUser.fromJson(json)),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'user': user?.toJson(),
    };
  }
}

class ArtistPlaylists {
  List<ArtistPlaylist>? data;
  int? total;

  ArtistPlaylists({
    this.data,
    this.total,
  });

  ArtistPlaylists copyWith({
    List<ArtistPlaylist>? data,
    int? total,
  }) {
    return ArtistPlaylists(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory ArtistPlaylists.fromJson(Map<String, dynamic> json) {
    return ArtistPlaylists(
      data: parseList(json['data'], (json) => ArtistPlaylist.fromJson(json)),
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
