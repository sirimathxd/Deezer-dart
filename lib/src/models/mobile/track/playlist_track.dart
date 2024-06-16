import 'package:deezer/src/models/mobile/track/album_track.dart';
import 'package:deezer/src/utils/utils.dart';

class PlaylistTracks {
  List<AlbumTrack>? data;
  int? total;
  String? checksum;

  PlaylistTracks({
    this.data,
    this.total,
    this.checksum,
  });

  PlaylistTracks copyWith({
    List<AlbumTrack>? data,
    int? total,
    String? checksum,
  }) {
    return PlaylistTracks(
      data: data ?? this.data,
      total: total ?? this.total,
      checksum: checksum ?? this.checksum,
    );
  }

  factory PlaylistTracks.fromJson(Map<String, dynamic> json) {
    return PlaylistTracks(
      data:parseList(json['data'], (v) => AlbumTrack.fromJson(v)),
      total: parseTotal(json['total'], json['data']),
      checksum: json['checksum'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((e) => e.toJson()).toList(),
      'total': total,
      'checksum': checksum,
    };
  }
}
