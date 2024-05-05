class Album {
  int id;
  String title;
  String cover;
  String coverMedium;
  String coverBig;
  String md5Image;

  Album({
    required this.id,
    required this.title,
    required this.cover,
    required this.coverMedium,
    required this.coverBig,
    required this.md5Image,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      cover: json['cover'],
      coverMedium: json['cover_medium'],
      coverBig: json['cover_big'],
      md5Image: json['md5_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'cover': cover,
      'cover_medium': coverMedium,
      'cover_big': coverBig,
      'md5_image': md5Image,
    };
  }
}
