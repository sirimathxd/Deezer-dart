import 'package:deezer/src/models/mobile/user/user_with_pic.dart';
import 'package:deezer/src/utils/utils.dart';

class User extends UserWithPic {
  String? country;

  User({
    super.id,
    super.name,
    super.link,
    super.picture,
    super.pictureSmall,
    super.pictureMedium,
    super.pictureBig,
    super.pictureXl,
    this.country,
    super.tracklist,
    super.type,
  });

  @override
  User copyWith({
    String? id,
    String? name,
    String? link,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? country,
    String? tracklist,
    String? type,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      country: country ?? this.country,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'user', json['id']),
      picture: json['picture'],
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      country: json['country'],
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'country': country,
    };
  }
}
