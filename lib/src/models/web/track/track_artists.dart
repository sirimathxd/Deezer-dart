class TrackArtists {
  String? artId;
  String? artName;
  String? artPicture;

  TrackArtists({this.artId, this.artName, this.artPicture});

  factory TrackArtists.fromJson(Map<String, dynamic> json) {
    return TrackArtists(
      artId: json['ART_ID'] ?? 'unknown',
      artName: json['ART_NAME'] ?? 'unknown',
      artPicture: json['ART_PICTURE'] ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ART_ID': artId,
      'ART_NAME': artName,
      'ART_PICTURE': artPicture,
    };
  }
}
