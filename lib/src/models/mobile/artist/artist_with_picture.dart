import 'package:deezer/src/models/mobile/artist/base_artist.dart';
import 'package:deezer/src/utils/utils.dart';

class ArtistWithPicture extends BaseArtist {
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;

  ArtistWithPicture({
    super.id,
    super.name,
    super.link,
    super.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    super.tracklist,
    super.type,
  });

  @override
  ArtistWithPicture copyWith({
    String? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? tracklist,
    String? type,
  }) {
    return ArtistWithPicture(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      share: share ?? this.share,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory ArtistWithPicture.fromJson(Map<String, dynamic> json) {
    return ArtistWithPicture(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'artist', json['id']),
      share: getlink(json['share'], 'artist', json['id']),
      picture: getlink(json['picture'], 'artist', '${json['id']}/image'),
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      'picture': picture,
      'picture_small': pictureSmall,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
      'picture_xl': pictureXl,
    };
  }
}
