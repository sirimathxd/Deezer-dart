import 'package:deezer/src/utils/utils.dart';

class BaseArtist {
  String? id;
  String? name;
  String? link;
  String? share;
  String? tracklist;
  String? type;

  BaseArtist({
    this.id,
    this.name,
    this.link,
    this.share,
    this.tracklist,
    this.type,
  });

  BaseArtist copyWith({
    String? id,
    String? name,
    String? link,
    String? share,
    String? tracklist,
    String? type,
  }) {
    return BaseArtist(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      share: share ?? this.share,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory BaseArtist.fromJson(Map<String, dynamic> json) {
    return BaseArtist(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'artist', json['id']),
      share: getlink(json['share'], 'artist', json['id']),
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'link': link,
      'share': share,
      'tracklist': tracklist,
      'type': type,
    };
  }
}
