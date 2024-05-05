class FavData {
  String sngId;
  int dateFavorite;
  String type;

  FavData({
    required this.sngId,
    required this.dateFavorite,
    required this.type,
  });

  factory FavData.fromJson(Map<String, dynamic> json) {
    return FavData(
      sngId: json['SNG_ID'],
      dateFavorite: json['DATE_FAVORITE'],
      type: json['__TYPE__'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'SNG_ID': sngId,
      'DATE_FAVORITE': dateFavorite,
      '__TYPE__': type,
    };
  }
}
