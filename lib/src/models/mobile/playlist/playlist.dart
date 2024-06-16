import 'package:deezer/src/models/mobile/playlist/base_playlist.dart';
import 'package:deezer/src/models/mobile/track/playlist_track.dart';
import 'package:deezer/src/models/mobile/user/base_user.dart';
import 'package:deezer/src/utils/utils.dart';

class Playlist extends BasePlaylist {
  String? description;
  int? duration;
  bool? isLovedTrack;
  bool? collaborative;
  int? nbTracks;
  int? fans;
  BaseUser? creator;
  PlaylistTracks? tracks;

  Playlist({
    super.id,
    super.title,
    this.description,
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
    this.creator,
    super.type,
    this.tracks,
  });

  @override
  Playlist copyWith({
    String? id,
    String? title,
    String? description,
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
    BaseUser? creator,
    String? type,
    PlaylistTracks? tracks,
  }) {
    return Playlist(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      public: public ?? this.public,
      isLovedTrack: isLovedTrack ?? this.isLovedTrack,
      collaborative: collaborative ?? this.collaborative,
      nbTracks: nbTracks ?? this.nbTracks,
      fans: fans ?? this.fans,
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
      creator: creator ?? this.creator,
      type: type ?? this.type,
      tracks: tracks ?? this.tracks,
    );
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: parseString(json['id']),
      title: json['title'],
      description: json['description'],
      duration: parseInt(json['duration']),
      public: json['public'],
      isLovedTrack: json['is_loved_track'],
      collaborative: json['collaborative'],
      nbTracks: parseInt(json['nb_tracks']),
      fans: parseInt(json['fans']),
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
      creator: parseJson(
        json['creator'],
        (json) => BaseUser.fromJson(json),
      ),
      type: json['type'],
      tracks: parseJson(
        json['tracks'],
        (json) => PlaylistTracks.fromJson(json),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'description': description,
      'duration': duration,
      'is_loved_track': isLovedTrack,
      'collaborative': collaborative,
      'nb_tracks': nbTracks,
      'fans': fans,
      'creator': creator?.toJson(),
      'tracks': tracks?.toJson(),
    };
  }
}
