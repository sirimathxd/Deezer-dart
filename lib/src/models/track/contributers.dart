class SngContributors {
  List<String>? mainArtist;
  List<String>? composer;
  List<String>? artist;

  SngContributors({this.mainArtist, this.composer, this.artist});

  factory SngContributors.fromJson(Map<String, dynamic> json) {
    return SngContributors(
      mainArtist: json['main_artist'] != null
          ? List<String>.from(
              json['main_artist'],
            )
          : <String>[],
      composer: json['composer'] != null
          ? List<String>.from(
              json['composer'],
            )
          : <String>[],
      artist: json['artist'] != null
          ? List<String>.from(
              json['artist'],
            )
          : <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'main_artist': mainArtist,
      'composer': composer,
      'artist': artist,
    };
  }
}
