class Artist {
  int id;
  String name;
  String link;
  String picture;
  String pictureMedium;
  String pictureBig;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.picture,
    required this.pictureMedium,
    required this.pictureBig,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      link: json['link'],
      picture: json['picture'],
      pictureMedium: json['picture_medium'],
      pictureBig: json['picture_big'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'link': link,
      'picture': picture,
      'picture_medium': pictureMedium,
      'picture_big': pictureBig,
    };
  }
}
