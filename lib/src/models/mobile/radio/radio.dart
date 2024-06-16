import 'package:deezer/src/utils/utils.dart';

class Radio {
  String? id;
  String? title;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  String? tracklist;
  String? md5Image;
  String? type;

  Radio({
    this.id,
    this.title,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.tracklist,
    this.md5Image,
    this.type,
  });

  Radio copyWith({
    String? id,
    String? title,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? tracklist,
    String? md5Image,
    String? type,
  }) {
    return Radio(
      id: id ?? this.id,
      title: title ?? this.title,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      tracklist: tracklist ?? this.tracklist,
      md5Image: md5Image ?? this.md5Image,
      type: type ?? this.type,
    );
  }

  factory Radio.fromJson(Map<String, dynamic> json) {
    return Radio(
      id: parseString(json['id']),
      title: json['title'],
      picture: json['picture'],
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      tracklist: json['tracklist'],
      md5Image: json['md5_image'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'picture_small': pictureSmall,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
      'picture_xl': pictureXl,
      'tracklist': tracklist,
      'md5_image': md5Image,
      'type': type,
    };
  }
}

class Radios {
  List<Radio>? data;
  int? total;

  Radios({
    this.data,
    this.total,
  });

  Radios copyWith({
    List<Radio>? data,
    int? total,
  }) {
    return Radios(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory Radios.fromJson(Map<String, dynamic> json) {
    return Radios(
      data: parseList(json['data'], (json) => Radio.fromJson(json)),
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
