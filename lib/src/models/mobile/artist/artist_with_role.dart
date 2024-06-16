import 'package:deezer/src/models/mobile/artist/artist.dart';
import 'package:deezer/src/utils/utils.dart';

class ArtistWithRole extends Artist {
  String? role;

  ArtistWithRole({
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
    super.type,
    this.role,
  });

  @override
  ArtistWithRole copyWith({
    String? role,
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
    String? type,
  }) {
    return ArtistWithRole(
      role: role ?? this.role,
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      share: share ?? this.share,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      nbAlbum: nbAlbum ?? this.nbAlbum,
      nbFan: nbFan ?? this.nbFan,
      radio: radio ?? this.radio,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory ArtistWithRole.fromJson(Map<String, dynamic> json) {
    return ArtistWithRole(
      role: json['role'],
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
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'role': role,
    };
  }
}
