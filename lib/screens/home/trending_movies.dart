import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:movie_buddy/controllers/movie_controller.dart';
import 'package:movie_buddy/screens/home/trending_movie_item.dart';
import 'package:shimmer/shimmer.dart';

class TrendingMovies extends GetView<MovieController> {
  const TrendingMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.isTrue) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade900,
            highlightColor: Colors.grey.shade800,
            enabled: true,
            child: CarouselSlider(
              items: [1, 2, 3]
                  .map(
                    (movie) => SizedBox(
                      height: MediaQuery.of(context).size.width * 0.6,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                  )
                  .toList(),
              // carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                initialPage: 0,
              ),
            ),
          );
        } else {
          return CarouselSlider(
            items: controller.movies
                .map((movie) => TrendingMovieItem(
                      index: controller.movies.indexOf(movie),
                      movie: movie,
                    ))
                .toList(),
            // carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              initialPage: 0,
            ),
          );
        }
      },
    );
  }
}
