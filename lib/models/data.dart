import 'package:movie_buddy/models/movie.dart';

class Data {
  Data({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  int movieCount;
  int limit;
  int pageNumber;
  List<Movie> movies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movieCount: json["movie_count"],
    limit: json["limit"],
    pageNumber: json["page_number"],
    movies: List<Movie>.from((json["movies"] ?? []).map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "movie_count": movieCount,
    "limit": limit,
    "page_number": pageNumber,
    "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
  };
}