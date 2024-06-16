import 'package:deezer/src/models/web/track/track.dart';

class SongData {
  List<int> data;
  Track track;
  SongData({required this.data, required this.track});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data,
      'track': track.toJson(),
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
