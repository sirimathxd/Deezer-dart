import 'package:deezer/src/utils/utils.dart';

class BasePlaylist {
  String? id;
  String? title;
  bool? public;
  String? link;
  String? share;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  String? checksum;
  String? tracklist;
  String? creationDate;
  String? md5Image;
  String? pictureType;
  String? type;

  BasePlaylist({
    this.id,
    this.title,
    this.public,
    this.link,
    this.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.checksum,
    this.tracklist,
    this.creationDate,
    this.md5Image,
    this.pictureType,
    this.type,
  });

  BasePlaylist copyWith({
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
    String? type,
  }) {
    return BasePlaylist(
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
      type: type ?? this.type,
    );
  }

  factory BasePlaylist.fromJson(Map<String, dynamic> json) {
    return BasePlaylist(
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
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'public': public,
      'link': link,
      'share': share,
      'picture': picture,
      'picture_small': pictureSmall,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
      'picture_xl': pictureXl,
      'checksum': checksum,
      'tracklist': tracklist,
      'creation_date': creationDate,
      'md5_image': md5Image,
      'picture_type': pictureType,
      'type': type,
    };
  }

}
