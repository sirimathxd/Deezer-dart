import 'lyrics_sync.dart';

class Lyrics {
  String lyricsId;
  List<LyricsSyncJson> lyricsSyncJson;
  String lyricsText;
  String lyricsCopyrights;
  String lyricsWriters;

  Lyrics({
    required this.lyricsId,
    required this.lyricsSyncJson,
    required this.lyricsText,
    required this.lyricsCopyrights,
    required this.lyricsWriters,
  });

  factory Lyrics.fromJson(Map<String, dynamic> json) {
    return Lyrics(
      lyricsId: json['LYRICS_ID'] ?? 'unknown',
      lyricsSyncJson: json['LYRICS_SYNC_JSON'] != null
          ? List<LyricsSyncJson>.from(
              json['LYRICS_SYNC_JSON'].map(
                (e) => LyricsSyncJson.fromJson(e),
              ),
            )
          : <LyricsSyncJson>[],
      lyricsText: json['LYRICS_TEXT'] ?? 'unknown',
      lyricsCopyrights: json['LYRICS_COPYRIGHTS'] ?? 'unknown',
      lyricsWriters: json['LYRICS_WRITERS'] ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'LYRICS_ID': lyricsId,
      'LYRICS_SYNC_JSON': lyricsSyncJson.map((e) => e.toJson()).toList(),
      'LYRICS_TEXT': lyricsText,
      'LYRICS_COPYRIGHTS': lyricsCopyrights,
      'LYRICS_WRITERS': lyricsWriters,
    };
  }
}
