// This file contains the base album model
// Deezer API returns the album details with different properties
// [BaseAlbum] is Contains the common properties of the album

import 'package:deezer/src/utils/utils.dart';

class BaseAlbum {
  String? id;
  String? title;
  String? link;
  String? share;
  String? cover;
  String? coverSmall;
  String? coverMedium;
  String? coverBig;
  String? coverXl;
  String? md5Image;
  String? tracklist;
  String? type;

  BaseAlbum({
    this.id,
    this.title,
    this.link,
    this.share,
    this.cover,
    this.coverSmall,
    this.coverMedium,
    this.coverBig,
    this.coverXl,
    this.md5Image,
    this.tracklist,
    this.type,
  });

  BaseAlbum copyWith({
    String? id,
    String? title,
    String? link,
    String? share,
    String? cover,
    String? coverSmall,
    String? coverMedium,
    String? coverBig,
    String? coverXl,
    String? md5Image,
    String? tracklist,
    String? type,
  }) {
    return BaseAlbum(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      share: share ?? this.share,
      cover: cover ?? this.cover,
      coverSmall: coverSmall ?? this.coverSmall,
      coverMedium: coverMedium ?? this.coverMedium,
      coverBig: coverBig ?? this.coverBig,
      coverXl: coverXl ?? this.coverXl,
      md5Image: md5Image ?? this.md5Image,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory BaseAlbum.fromJson(Map<String, dynamic> json) {
    return BaseAlbum(
      id: parseString(json['id']),
      title: json['title'],
      link: getlink(json['link'], 'album', json['id']),
      share: getlink(json['share'], 'album', json['id']),
      cover: json['cover'],
      coverSmall: json['cover_small'],
      coverMedium: json['cover_medium'],
      coverBig: json['cover_big'],
      coverXl: json['cover_xl'],
      md5Image: json['md5_image'],
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'link': link,
      'share': share,
      'cover': cover,
      'cover_small': coverSmall,
      'cover_medium': coverMedium,
      'cover_big': coverBig,
      'cover_xl': coverXl,
      'md5_image': md5Image,
      'tracklist': tracklist,
      'type': type,
    };
  }
}
