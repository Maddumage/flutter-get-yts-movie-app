import 'package:get/get.dart';
import 'package:movie_buddy/models/movie.dart';
import 'package:movie_buddy/models/movie_data.dart';
import 'package:movie_buddy/models/movie_details.dart';

import '../services/yts_service.dart';

class MovieController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isLoadingTopRatedMovies = true.obs;
  RxList<Movie> movies = <Movie>[].obs;
  RxList<Movie> topRatedMovies = <Movie>[].obs;
  RxString genre = 'all'.obs;
  RxBool isLoadingMovieDetails = true.obs;
  final movieDetails = MovieDetails().obs;

  @override
  void onInit() {
    fetchMovies();
    fetchTopRatedMovies();
    super.onInit();
  }

  void changeGenre(String category) {
    genre.value = category;
    fetchTopRatedMovies();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var data = await YTSService.fetchTrendingMovies();
      movies.value = data;
    } finally {
      isLoading(false);
    }
  }

  void fetchTopRatedMovies() async {
    try {
      isLoadingTopRatedMovies(true);
      var data = await YTSService.fetchTopRatedMovies(genre.value);
      topRatedMovies.value = data;
    } finally {
      isLoadingTopRatedMovies(false);
    }
  }

  void getMovieDetails(int id) async {
    try {
      isLoadingMovieDetails(true);
      var data = await YTSService.fetchMovie(id);
      if(data != null){
        movieDetails.value = data.movie!;
      }
    } finally {
      isLoadingMovieDetails(false);
    }
  }
}
