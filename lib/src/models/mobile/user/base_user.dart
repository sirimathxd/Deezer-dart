import 'package:deezer/src/utils/utils.dart';

class BaseUser {
  String? id;
  String? name;
  String? link;
  String? tracklist;
  String? type;

  BaseUser({
    this.id,
    this.name,
    this.link,
    this.tracklist,
    this.type,
  });

  BaseUser copyWith({
    String? id,
    String? name,
    String? link,
    String? tracklist,
    String? type,
  }) {
    return BaseUser(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      tracklist: tracklist ?? this.tracklist,
      type: type ?? this.type,
    );
  }

  factory BaseUser.fromJson(Map<String, dynamic> json) {
    return BaseUser(
      id: parseString(json['id']),
      name: json['name'],
      link: getlink(json['link'], 'user', json['id']),
      tracklist: json['tracklist'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'link': link,
      'tracklist': tracklist,
      'type': type,
    };
  }
}
