import 'package:get/get.dart';
import 'package:movie_buddy/controllers/movie_controller.dart';

class InitialControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
  }
}
