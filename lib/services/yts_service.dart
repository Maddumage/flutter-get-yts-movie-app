import 'dart:convert';

import 'package:movie_buddy/http/http_client.dart';
import 'package:movie_buddy/models/movie.dart';
import 'package:movie_buddy/models/movie_data.dart';
import 'package:movie_buddy/models/movie_details_response.dart';
import 'package:movie_buddy/models/yts_response.dart';

class YTSService {
  static var httpClient = HttpClient();

  static Future<List<Movie>> fetchTrendingMovies() async {
    var response = await httpClient.get('list_movies.json?sort=seeds&limit=10');
    if (response != null) {
      YTSResponse ytsResponse = ytsResponseFromJson(response);
      return ytsResponse.data.movies;
    } else {
      return [];
    }
  }

  static Future<List<Movie>> fetchTopRatedMovies(String genre) async {
    var response = await httpClient.get('list_movies.json?minimum_rating=7&limit=10&genre=$genre');
    if (response != null) {
      YTSResponse ytsResponse = ytsResponseFromJson(response);
      return ytsResponse.data.movies;
    } else {
      return [];
    }
  }

  static Future<List<Movie>> fetchMovies() async {
    var response = await httpClient.get('list_movies.json');
    if (response != null) {
      YTSResponse ytsResponse = ytsResponseFromJson(response);
      return ytsResponse.data.movies;
    } else {
      return [];
    }
  }

  static Future<MovieData?> fetchMovie(int id) async {
    var response = await httpClient.get('movie_details.json?movie_id=$id');
    print(response);
    if (response != null) {
      MovieDetailsResponse movieDetailsResponse = movieDetailsResponseFromJson(response);
      return movieDetailsResponse.data;
    } else {
      return null;
    }
  }
}
