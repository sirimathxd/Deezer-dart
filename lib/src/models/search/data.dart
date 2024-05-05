import 'album.dart';
import 'artist.dart';

class SearchData {
  int id;
  String title;
  String link;
  int duration;
  String preview;
  String md5Image;
  Artist artist;
  Album album;
  String type;

  SearchData({
    required this.id,
    required this.title,
    required this.link,
    required this.duration,
    required this.preview,
    required this.md5Image,
    required this.artist,
    required this.album,
    required this.type,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      id: json['id'],
      title: json['title'],
      link: json['link'],
      duration: json['duration'],
      preview: json['preview'],
      md5Image: json['md5_image'],
      artist: Artist.fromJson(json['artist']),
      album: Album.fromJson(json['album']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'link': link,
      'duration': duration,
      'preview': preview,
      'md5_image': md5Image,
      'artist': artist.toJson(),
      'album': album.toJson(),
      'type': type,
    };
  }
}
