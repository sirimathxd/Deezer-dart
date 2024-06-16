import 'package:deezer/src/utils/utils.dart';

class AlbumGenre {
  int? id;
  String? name;
  String? picture;
  String? type;

  AlbumGenre({
    this.id,
    this.name,
    this.picture,
    this.type,
  });

  AlbumGenre copyWith({
    int? id,
    String? name,
    String? picture,
    String? type,
  }) {
    return AlbumGenre(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      type: type ?? this.type,
    );
  }

  factory AlbumGenre.fromJson(Map<String, dynamic> json) {
    return AlbumGenre(
      id: parseInt(json['id']),
      name: json['name'],
      picture: json['picture'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'picture': picture,
      'type': type,
    };
  }
}

class AlbumGenres {
  List<AlbumGenre>? data;
  int? total;

  AlbumGenres({
    this.data,
    this.total,
  });

  AlbumGenres copyWith({
    List<AlbumGenre>? data,
    int? total,
  }) {
    return AlbumGenres(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory AlbumGenres.fromJson(Map<String, dynamic> json) {
    return AlbumGenres(
      data: parseList(json['data'], (i) => AlbumGenre.fromJson(i)),
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
