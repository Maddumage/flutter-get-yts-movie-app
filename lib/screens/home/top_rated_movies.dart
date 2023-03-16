import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_buddy/screens/home/top_rated_movie_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../controllers/movie_controller.dart';

class TopRatedMovies extends GetView<MovieController> {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoadingTopRatedMovies.isTrue) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade900,
            highlightColor: Colors.grey.shade800,
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                );
              },
            ),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.topRatedMovies.length,
            itemBuilder: (context, index) {
              return TopRatedMovieItem(
                index: index,
                movie: controller.topRatedMovies[index],
              );
            },
          );
        }
      },
    );
  }
}
