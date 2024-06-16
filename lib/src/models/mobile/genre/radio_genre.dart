import 'package:deezer/src/models/mobile/radio/radio.dart';
import 'package:deezer/src/utils/utils.dart';

class RadioGenre {
  int? id;
  String? title;
  List<Radio>? radios;

  RadioGenre({
    this.id,
    this.title,
    this.radios,
  });

  RadioGenre copyWith({
    int? id,
    String? title,
    List<Radio>? radios,
  }) {
    return RadioGenre(
      id: id ?? this.id,
      title: title ?? this.title,
      radios: radios ?? this.radios,
    );
  }

  factory RadioGenre.fromJson(Map<String, dynamic> json) {
    return RadioGenre(
      id: parseInt(json['id']),
      title: json['title'],
      radios: parseList(json['radios'], (json) => Radio.fromJson(json)),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'radios': radios?.map((i) => i.toJson()).toList(),
    };
  }
}

class RadioGenres {
  List<RadioGenre>? data;
  int? total;

  RadioGenres({
    this.data,
    this.total,
  });

  RadioGenres copyWith({
    List<RadioGenre>? data,
    int? total,
  }) {
    return RadioGenres(
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  factory RadioGenres.fromJson(Map<String, dynamic> json) {
    return RadioGenres(
      data: parseList(json['data'], (i) => RadioGenre.fromJson(i)),
      total: parseInt(json['total']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data?.map((i) => i.toJson()).toList(),
      'total': total,
    };
  }
}
