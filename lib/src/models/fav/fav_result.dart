import 'package:deezer/src/models/fav/fav_data.dart';

class Results {
  List<FavData> data;
  // int count;
  int total;
  // int filteredCount;
  // String checksum;

  Results({
    required this.data,
    // required this.count,
    required this.total,
    // required this.filteredCount,
    // required this.checksum,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      data: List<FavData>.from(json['data'].map((x) => FavData.fromJson(x))),
      // count: json['count'],
      total: json['total'],
      // filteredCount: json['filtered_count'],
      // checksum: json['checksum'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data.map((x) => x.toJson()).toList(),
      // 'count': count,
      'total': total,
      // 'filtered_count': filteredCount,
      // 'checksum': checksum,
    };
  }
}
