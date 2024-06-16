import 'package:deezer/src/models/mobile/genre/album_genre.dart';
import 'package:deezer/src/utils/utils.dart';

class Genre extends AlbumGenre {
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;

  Genre({
    super.id,
    super.name,
    super.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    super.type,
  });

  @override
  Genre copyWith({
    int? id,
    String? name,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? type,
  }) {
    return Genre(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      type: type ?? this.type,
    );
  }

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: parseInt(json['id']),
      name: json['name'],
      picture: json['picture'],
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'picture_small': pictureSmall,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
      'picture_xl': pictureXl,
    };
  }
}

class Genres {
  List<Genre>? data;
  int? total;

  Genres({
    this.data,
    this.total,
  });

  Genres copyWith({
    List<Genre>? data,
    int? total,
  }) {
    return Genres(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      data: parseList(json['data'], (i) => Genre.fromJson(i)),
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
