import 'package:deezer/src/models/track/track_result.dart';

class Track {
  List error;
  TrackResults results;

  Track({required this.error, required this.results});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      error: json['error'],
      results: TrackResults.fromJson(json['results'] ?? {}),
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
