import 'package:movie_buddy/models/movie_details.dart';

import 'movie.dart';

class MovieData {
  MovieDetails? movie;

  MovieData({this.movie});

  MovieData.fromJson(Map<String, dynamic> json) {
    movie = json['movie'] != null ? MovieDetails.fromJson(json['movie']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movie != null) {
      data['movie'] = movie!.toJson();
    }
    return data;
  }
}
