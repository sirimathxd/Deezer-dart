import 'contributers.dart';
import 'track_artists.dart';

class TrackData {
  String sngId;
  String sngTitle;
  String artId;
  String artName;
  List<TrackArtists> artists;
  String albId;
  String albTitle;
  String md5Origin;
  String duration;
  String albPicture;
  String artPicture;
  String fileSize128;
  String fileSize320;
  String fileSizeFlac;
  String fileSize;
  String mediaVersion;
  String diskNumber;
  String trackNumber;
  String trackToken;
  int trackTokenExpire;
  String isrc;
  SngContributors sngContributors;
  String copyright;
  String releaseDate;

  TrackData({
    required this.sngId,
    required this.sngTitle,
    required this.artId,
    required this.artName,
    required this.artists,
    required this.albId,
    required this.albTitle,
    required this.md5Origin,
    required this.duration,
    required this.albPicture,
    required this.artPicture,
    required this.fileSize128,
    required this.fileSize320,
    required this.fileSizeFlac,
    required this.fileSize,
    required this.mediaVersion,
    required this.diskNumber,
    required this.trackNumber,
    required this.trackToken,
    required this.trackTokenExpire,
    required this.isrc,
    required this.sngContributors,
    required this.copyright,
    required this.releaseDate,
  });

  factory TrackData.fromJson(Map<String, dynamic> json) {
    return TrackData(
      sngId: json['SNG_ID'] ?? 'unknown',
      sngTitle: json['SNG_TITLE'] ?? 'unknown',
      artId: json['ART_ID'] ?? 'unknown',
      artName: json['ART_NAME'] ?? 'unknown',
      artists: json['ARTISTS'] != null
          ? List<TrackArtists>.from(
              json['ARTISTS'].map(
                (e) => TrackArtists.fromJson(e),
              ),
            )
          : <TrackArtists>[],
      albId: json['ALB_ID'] ?? 'unknown',
      albTitle: json['ALB_TITLE'] ?? 'unknown',
      md5Origin: json['MD5_ORIGIN'] ?? 'unknown',
      duration: json['DURATION'] ?? 'unknown',
      albPicture: json['ALB_PICTURE'] ?? 'unknown',
      artPicture: json['ART_PICTURE'] ?? 'unknown',
      fileSize128: json['FILESIZE_MP3_128'] ?? 'unknown',
      fileSize320: json['FILESIZE_MP3_320'] ?? 'unknown',
      fileSizeFlac: json['FILESIZE_FLAC'] ?? 'unknown',
      fileSize: json['FILESIZE'] ?? 'unknown',
      mediaVersion: json['MEDIA_VERSION'] ?? 'unknown',
      diskNumber: json['DISK_NUMBER'] ?? 'unknown',
      trackNumber: json['TRACK_NUMBER'] ?? 'unknown',
      trackToken: json['TRACK_TOKEN'] ?? 'unknown',
      trackTokenExpire: json['TRACK_TOKEN_EXPIRE'] ?? 0,
      isrc: json['ISRC'] ?? 'unknown',
      sngContributors: json['SNG_CONTRIBUTORS'] != null
          ? SngContributors.fromJson(json['SNG_CONTRIBUTORS'])
          : SngContributors(),
      copyright: json['COPYRIGHT'] ?? 'unknown',
      releaseDate: json['PHYSICAL_RELEASE_DATE'] ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'SNG_ID': sngId,
      'SNG_TITLE': sngTitle,
      'ART_ID': artId,
      'ART_NAME': artName,
      'ARTISTS': artists.map((e) => e.toJson()).toList(),
      'ALB_ID': albId,
      'ALB_TITLE': albTitle,
      'MD5_ORIGIN': md5Origin,
      'DURATION': duration,
      'ALB_PICTURE': albPicture,
      'ART_PICTURE': artPicture,
      'FILESIZE_MP3_128': fileSize128,
      'FILESIZE_MP3_320': fileSize320,
      'FILESIZE_FLAC': fileSizeFlac,
      'FILESIZE': fileSize,
      'MEDIA_VERSION': mediaVersion,
      'DISK_NUMBER': diskNumber,
      'TRACK_NUMBER': trackNumber,
      'TRACK_TOKEN': trackToken,
      'TRACK_TOKEN_EXPIRE': trackTokenExpire,
      'ISRC': isrc,
      'SNG_CONTRIBUTORS': sngContributors.toJson(),
      'COPYRIGHT': copyright,
      'PHYSICAL_RELEASE_DATE': releaseDate,
    };
  }
}
