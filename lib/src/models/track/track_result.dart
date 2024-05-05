import 'package:deezer/src/models/track/lyrics.dart';
import 'package:deezer/src/models/track/track_data.dart';

class TrackResults {
  TrackData data;
  Lyrics lyrics;

  TrackResults({required this.data, required this.lyrics});

  factory TrackResults.fromJson(Map<String, dynamic> json) {
    return TrackResults(
      data: TrackData.fromJson(json['DATA'] ?? {}),
      lyrics: Lyrics.fromJson(json['LYRICS'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'DATA': data.toJson(),
      'LYRICS': lyrics.toJson(),
    };
  }
}
