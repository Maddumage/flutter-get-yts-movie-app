import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/movie_controller.dart';
import 'content.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final MovieController controller = Get.find();

  @override
  void initState() {
    var movieId = Get.arguments;
    controller.getMovieDetails(movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
          'assets/images/left-arrow.png',
          width: 24,
          height: 24,
          color: Colors.white,
        ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/heart.png',
              width: 24,
              height: 24,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Obx(
        () {
          if (controller.isLoadingMovieDetails.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Content(
              movieDetails: controller.movieDetails.value,
            );
          }
        },
      ),
    );
  }
}
