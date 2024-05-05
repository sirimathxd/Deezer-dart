import 'package:deezer/src/models/track/track_data.dart';

class Tracks {
  List error;
  TracksResults results;

  Tracks({required this.error, required this.results});

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      error: json['error'],
      results: TracksResults.fromJson(json['results'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'error': error,
      'results': results.toJson(),
    };
  }

  @override
  String toString() {
    return 'Track{error: $error, results: $results}';
  }
}

class TracksResults {
  List<TrackData> data;
  int total;

  TracksResults({required this.data, required this.total});

  factory TracksResults.fromJson(Map<String, dynamic> json) {
    return TracksResults(
      data: (json['data'] as List).map((e) => TrackData.fromJson(e)).toList(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}
