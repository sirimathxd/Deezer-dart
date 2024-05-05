class LyricsSyncJson {
  String lrcTimestamp;
  String milliseconds;
  String duration;
  String line;

  LyricsSyncJson({
    required this.lrcTimestamp,
    required this.milliseconds,
    required this.duration,
    required this.line,
  });

  factory LyricsSyncJson.fromJson(Map<String, dynamic> json) {
    return LyricsSyncJson(
      lrcTimestamp: json['lrc_timestamp'] ?? 'unknown',
      milliseconds: json['milliseconds'] ?? 'unknown',
      duration: json['duration'] ?? 'unknown',
      line: json['line'] ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lrc_timestamp': lrcTimestamp,
      'milliseconds': milliseconds,
      'duration': duration,
      'line': line,
    };
  }
}
