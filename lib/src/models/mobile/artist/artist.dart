import 'package:deezer/src/models/mobile/artist/chart_artist.dart';
import 'package:deezer/src/utils/utils.dart';

class Artist extends ChartArtist {
  int? nbAlbum;
  int? nbFan;

  Artist({
    super.id,
    super.name,
    super.link,
    super.share,
    super.picture,
    super.pictureSmall,
    super.pictureMedium,
    super.pictureBig,
    super.pictureXl,
    this.nbAlbum,
    this.nbFan,
    super.radio,
    super.tracklist,
    super.type,
  });

  @override
  Artist copyWith({
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
    return Artist(
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

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
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
    return <String, dynamic>{
      ...super.toJson(),
      'nb_album': nbAlbum,
      'nb_fan': nbFan,
      'radio': radio,
    };
  }
}

class Artists {
  List<Artist>? data;
  int? total;
  String? next;

  Artists({
    this.data,
    this.total,
    this.next,
  });

  Artists copyWith({
    List<Artist>? data,
    int? total,
    String? next,
  }) {
    return Artists(
      data: data ?? this.data,
      total: total ?? this.total,
      next: next ?? this.next,
    );
  }

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      data: parseList(json['data'], (i) => Artist.fromJson(i)),
      total: parseTotal(json['total'], json['data']),
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((i) => i.toJson()).toList(),
      'total': total,
      'next': next,
    };
  }
}
