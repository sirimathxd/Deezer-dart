import 'package:deezer/src/models/mobile/user/base_user.dart';
import 'package:deezer/src/utils/utils.dart';

class UserWithPic extends BaseUser {
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;

  UserWithPic({
    super.id,
    super.name,
    super.link,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    super.tracklist,
    super.type,
  });

  @override
  UserWithPic copyWith({
    String? id,
    String? name,
    String? link,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? tracklist,
    String? type,
  }) {
    return UserWithPic(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory UserWithPic.fromJson(Map<String, dynamic> json) {
    return UserWithPic(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'user', json['id']),
      picture: json['picture'],
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
    return <String, dynamic>{
      ...super.toJson(),
      'picture': picture,
      'picture_small': pictureSmall,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
      'picture_xl': pictureXl,
    };
  }
}

class UsersWithPic {
  List<UserWithPic>? data;
  int? total;

  UsersWithPic({
    this.data,
    this.total,
  });

  UsersWithPic copyWith({
    List<UserWithPic>? data,
    int? total,
  }) {
    return UsersWithPic(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory UsersWithPic.fromJson(Map<String, dynamic> json) {
    return UsersWithPic(
      data: parseList(json['data'], (json) => UserWithPic.fromJson(json)),
      total: parseTotal(json['total'], json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((i) => i.toJson()).toList(),
      'total': total,
    };
  }
}
