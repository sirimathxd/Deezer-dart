import 'package:deezer/src/utils/utils.dart';

class BaseTrack {
  String? id;
  String? title;
  String? link;
  int? duration;
  int? rank;
  bool? explicitLyrics;
  int? explicitContentLyrics;
  int? explicitContentCover;
  String? preview;
  String? md5Image;

  BaseTrack({
    this.id,
    this.title,
    this.link,
    this.duration,
    this.rank,
    this.explicitLyrics,
    this.explicitContentLyrics,
    this.explicitContentCover,
    this.preview,
    this.md5Image,
  });

  BaseTrack copyWith({
    String? id,
    String? title,
    String? link,
    int? duration,
    int? rank,
    bool? explicitLyrics,
    int? explicitContentLyrics,
    int? explicitContentCover,
    String? preview,
    String? md5Image,
  }) {
    return BaseTrack(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      duration: duration ?? this.duration,
      rank: rank ?? this.rank,
      explicitLyrics: explicitLyrics ?? this.explicitLyrics,
      explicitContentLyrics: explicitContentLyrics ?? this.explicitContentLyrics,
      explicitContentCover: explicitContentCover ?? this.explicitContentCover,
      preview: preview ?? this.preview,
      md5Image: md5Image ?? this.md5Image,
    );
  }

  factory BaseTrack.fromJson(Map<String, dynamic> map) {
    return BaseTrack(
      id: parseString(map['id']),
      title: map['title'],
      link: getlink(map['link'], 'track', map['id']),
      duration: parseInt(map['duration']),
      rank: parseInt(map['rank']),
      explicitLyrics: map['explicit_lyrics'],
      explicitContentLyrics: parseInt(map['explicit_content_lyrics']),
      explicitContentCover: parseInt(map['explicit_content_cover']),
      preview: map['preview'],
      md5Image: map['md5_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'link': link,
      'duration': duration,
      'rank': rank,
      'explicit_lyrics': explicitLyrics,
      'explicit_content_lyrics': explicitContentLyrics,
      'explicit_content_cover': explicitContentCover,
      'preview': preview,
      'md5_image': md5Image,
    };
  }
}
