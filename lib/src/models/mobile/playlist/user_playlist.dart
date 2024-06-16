import 'package:deezer/src/models/mobile/playlist/base_playlist.dart';
import 'package:deezer/src/models/mobile/user/base_user.dart';
import 'package:deezer/src/utils/utils.dart';

class UserPlaylist extends BasePlaylist {
  int? duration;
  bool? isLovedTrack;
  bool? collaborative;
  int? nbTracks;
  int? fans;
  int? timeAdd;
  int? timeMod;
  BaseUser? creator;

  UserPlaylist({
    super.id,
    super.title,
    this.duration,
    super.public,
    this.isLovedTrack,
    this.collaborative,
    this.nbTracks,
    this.fans,
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
    this.timeAdd,
    this.timeMod,
    this.creator,
    super.type,
  });

  @override
  UserPlaylist copyWith({
    String? id,
    String? title,
    int? duration,
    bool? public,
    bool? isLovedTrack,
    bool? collaborative,
    int? nbTracks,
    int? fans,
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
    int? timeAdd,
    int? timeMod,
    BaseUser? creator,
    String? type,
  }) {
    return UserPlaylist(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      public: public ?? this.public,
      isLovedTrack: isLovedTrack ?? this.isLovedTrack,
      collaborative: collaborative ?? this.collaborative,
      nbTracks: nbTracks ?? this.nbTracks,
      fans: fans ?? this.fans,
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
      timeAdd: timeAdd ?? this.timeAdd,
      timeMod: timeMod ?? this.timeMod,
      creator: creator ?? this.creator,
      type: type ?? this.type,
    );
  }

  factory UserPlaylist.fromJson(Map<String, dynamic> json) {
    return UserPlaylist(
      id: parseString(json['id']),
      title: json['title'],
      duration: parseInt(json['duration']),
      public: json['public'],
      isLovedTrack: json['is_loved_track'],
      collaborative: json['collaborative'],
      nbTracks: parseInt(json['nb_tracks']),
      fans: parseInt(json['fans']),
      link: getlink(json['link'], 'playlist', json['id']),
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
      timeAdd: parseInt(json['time_add']),
      timeMod: parseInt(json['time_mod']),
      creator: parseJson(json['creator'], (json) => BaseUser.fromJson(json)),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'duration': duration,
      'is_loved_track': isLovedTrack,
      'collaborative': collaborative,
      'nb_tracks': nbTracks,
      'fans': fans,
      'time_add': timeAdd,
      'time_mod': timeMod,
      'creator': creator?.toJson(),
    };
  }
}

class UserPlaylists {
  List<UserPlaylist>? data;
  int? total;

  UserPlaylists({
    this.data,
    this.total,
  });

  UserPlaylists copyWith({
    List<UserPlaylist>? data,
    int? total,
  }) {
    return UserPlaylists(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory UserPlaylists.fromJson(Map<String, dynamic> json) {
    return UserPlaylists(
      data: parseList(json['data'], (json) => UserPlaylist.fromJson(json)),
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
