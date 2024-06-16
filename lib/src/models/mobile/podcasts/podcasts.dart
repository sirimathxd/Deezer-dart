import 'package:deezer/src/utils/utils.dart';

class ChartPodcast {
  int? id;
  String? title;
  String? description;
  bool? available;
  int? fans;
  String? link;
  String? share;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  String? type;

  ChartPodcast({
    this.id,
    this.title,
    this.description,
    this.available,
    this.fans,
    this.link,
    this.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.type,
  });

  ChartPodcast copyWith({
    int? id,
    String? title,
    String? description,
    bool? available,
    int? fans,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    String? type,
  }) {
    return ChartPodcast(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      available: available ?? this.available,
      fans: fans ?? this.fans,
      link: link ?? this.link,
      share: share ?? this.share,
      picture: picture ?? this.picture,
      pictureSmall: pictureSmall ?? this.pictureSmall,
      pictureMedium: pictureMedium ?? this.pictureMedium,
      pictureBig: pictureBig ?? this.pictureBig,
      pictureXl: pictureXl ?? this.pictureXl,
      type: type ?? this.type,
    );
  }

  factory ChartPodcast.fromJson(Map<String, dynamic> json) {
    return ChartPodcast(
      id: parseInt(json['id']),
      title: json['title'],
      description: json['description'],
      available: json['available'],
      fans: parseInt(json['fans']),
      link: json['link'],
      share: json['share'],
      picture: json['picture'],
      pictureSmall: json['picture_small'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
      pictureXl: json['picture_xl'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'available': available,
      'fans': fans,
      'link': link,
      'share': share,
      'picture': picture,
      'picture_small': pictureSmall,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
      'picture_xl': pictureXl,
      'type': type,
    };
  }
}

class ChartPodcasts {
  List<ChartPodcast>? data;
  int? total;

  ChartPodcasts({
    this.data,
    this.total,
  });

  ChartPodcasts copyWith({
    List<ChartPodcast>? data,
    int? total,
  }) {
    return ChartPodcasts(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory ChartPodcasts.fromJson(Map<String, dynamic> json) {
    return ChartPodcasts(
      data: parseList(json['data'], (json) {
        return ChartPodcast.fromJson(json);
      }),
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