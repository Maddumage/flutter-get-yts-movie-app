import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_buddy/controllers/initial_controller_bindings.dart';
import 'package:movie_buddy/controllers/movie_controller.dart';
import 'package:movie_buddy/screens/app/app.dart';
import 'package:movie_buddy/screens/home/home.dart';
import 'package:movie_buddy/screens/movie_details/movie_details.dart';
import 'package:movie_buddy/utils/themes.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MovieBuddyApp());
}

class MovieBuddyApp extends StatelessWidget {
  const MovieBuddyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: customDarkTheme(),
      home: const App(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialControllerBindings(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
        ),
        GetPage(
          name: '/details',
          page: () => const MovieDetails(),
        ),
      ],
    );
  }
}
