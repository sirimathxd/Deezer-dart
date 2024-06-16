import 'package:deezer/src/models/mobile/artist/artist_with_picture.dart';
import 'package:deezer/src/utils/utils.dart';

class ChartArtist extends ArtistWithPicture {
  bool? radio;

  ChartArtist({
    super.id,
    super.name,
    super.link,
    super.share,
    super.picture,
    super.pictureSmall,
    super.pictureMedium,
    super.pictureBig,
    super.pictureXl,
    this.radio,
    super.tracklist,
    super.type,
  });

  @override
  ChartArtist copyWith({
    String? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    bool? radio,
    String? tracklist,
    String? type,
  }) {
    return ChartArtist(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      share: share ?? this.share,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      radio: radio ?? this.radio,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory ChartArtist.fromJson(Map<String, dynamic> json) {
    return ChartArtist(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'artist', json['id']),
      share: getlink(json['share'], 'artist', json['id']),
      picture: getlink(json['picture'], 'artist', '${json['id']}/image'),
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      radio: json['radio'],
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ...super.toJson(),
      'radio': radio,
    };
  }
}

class ChartArtists {
  List<ChartArtist>? data;
  int? total;

  ChartArtists({this.data, this.total});

  factory ChartArtists.fromJson(Map<String, dynamic> json) {
    return ChartArtists(
      data: parseList(json['data'], (i) => ChartArtist.fromJson(i)),
      total: parseTotal(json['total'], json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}
