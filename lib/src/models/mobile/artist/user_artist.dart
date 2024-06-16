import 'package:deezer/src/models/mobile/artist/artist.dart';
import 'package:deezer/src/utils/utils.dart';

class UserArtist extends Artist {
  int? timeAdd;

  UserArtist({
    super.id,
    super.name,
    super.link,
    super.share,
    super.picture,
    super.pictureSmall,
    super.pictureMedium,
    super.pictureBig,
    super.pictureXl,
    super.nbAlbum,
    super.nbFan,
    super.radio,
    super.tracklist,
    this.timeAdd,
    super.type,
  });

  @override
  UserArtist copyWith({
    String? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    int? nbAlbum,
    int? nbFan,
    bool? radio,
    String? tracklist,
    int? timeAdd,
    String? type,
  }) {
    return UserArtist(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      nbAlbum: nbAlbum ?? this.nbAlbum,
      nbFan: nbFan ?? this.nbFan,
      radio: radio ?? this.radio,
      tracklist: tracklist ?? this.tracklist,
      timeAdd: timeAdd ?? this.timeAdd,
      type: type ?? this.type,
    );
  }

  factory UserArtist.fromJson(Map<String, dynamic> json) {
    return UserArtist(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'artist', json['id']),
      share: getlink(json['share'], 'artist', json['id']),
      picture: getlink(json['picture'], 'artist', '${json['id']}/image'),
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      nbAlbum: parseInt(json['nb_album']),
      nbFan: parseInt(json['nb_fan']),
      radio: json['radio'],
      tracklist: json['tracklist'],
      timeAdd: parseInt(json['time_add']),
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'time_add': timeAdd,
    };
  }
}

class UserArtists {
  List<UserArtist>? data;
  int? total;

  UserArtists({
    this.data,
    this.total,
  });

  UserArtists copyWith({
    List<UserArtist>? data,
    int? total,
  }) {
    return UserArtists(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory UserArtists.fromJson(Map<String, dynamic> json) {
    return UserArtists(
      data: (json['data'] as List?)?.map((i) => UserArtist.fromJson(i)).toList(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((i) => i.toJson()).toList(),
      'total': total,
    };
  }
}
