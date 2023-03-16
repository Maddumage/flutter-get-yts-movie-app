import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/movie_controller.dart';

class CategoryMenuItem extends GetView<MovieController> {
  const CategoryMenuItem({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeGenre(title.toLowerCase());
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
        constraints: const BoxConstraints(
          minWidth: 100,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: controller.genre.value == title.toLowerCase()
                    ? Colors.pink
                    : Colors.black87,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
