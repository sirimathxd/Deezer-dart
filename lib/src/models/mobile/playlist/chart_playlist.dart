import 'package:deezer/src/models/mobile/playlist/artist_playlist.dart';
import 'package:deezer/src/models/mobile/user/base_user.dart';
import 'package:deezer/src/utils/utils.dart';

class ChartPlaylist extends ArtistPlaylist {
  int? nbTracks;

  ChartPlaylist({
    super.id,
    super.title,
    super.public,
    this.nbTracks,
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
    super.user,
    super.type,
  });

  @override
  ChartPlaylist copyWith({
    String? id,
    String? title,
    bool? public,
    int? nbTracks,
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
    return ChartPlaylist(
      id: id ?? this.id,
      title: title ?? this.title,
      public: public ?? this.public,
      nbTracks: nbTracks ?? this.nbTracks,
      link: link ?? this.link,
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

  factory ChartPlaylist.fromJson(Map<String, dynamic> json) {
    return ChartPlaylist(
      id: parseString(json['id']),
      title: json['title'],
      public: json['public'],
      nbTracks: parseInt(json['nb_tracks']),
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
      'nb_tracks': nbTracks,
    };
  }
}

class ChartPlaylists {
  List<ChartPlaylist>? data;
  int? total;

  ChartPlaylists({
    this.data,
    this.total,
  });

  ChartPlaylists copyWith({
    List<ChartPlaylist>? data,
    int? total,
  }) {
    return ChartPlaylists(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory ChartPlaylists.fromJson(Map<String, dynamic> json) {
    return ChartPlaylists(
      data: parseList(json['data'], (json) => ChartPlaylist.fromJson(json)),
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
