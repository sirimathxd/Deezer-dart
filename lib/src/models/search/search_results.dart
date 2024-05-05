import 'package:deezer/src/models/search/data.dart';

class Result {
  List<SearchData> tracks;
  int total;

  Result({required this.tracks, required this.total});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      tracks: json['tracks']['data'] != null
          ? (json['tracks']['data'] as List)
              .map((e) => SearchData.fromJson(e))
              .toList()
          : [],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tracks': tracks.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}
