import 'package:deezer/src/models/fav/fav_result.dart';

class Favourites {
  List error;
  Results results;

  Favourites({required this.error, required this.results});

  factory Favourites.fromJson(Map<String, dynamic> json) {
    return Favourites(
      error: json['error'],
      results: Results.fromJson(json['results'] ?? {}),
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
    return 'Favourites{error: $error, results: $results}';
  }
}
