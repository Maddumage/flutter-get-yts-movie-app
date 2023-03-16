import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_buddy/controllers/movie_controller.dart';
import 'package:movie_buddy/screens/favourites%20/Favourites.dart';
import 'package:movie_buddy/screens/home/home.dart';
import 'package:movie_buddy/screens/profile/profile.dart';
import 'package:movie_buddy/screens/search/SearchScreen.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    SearchScreen(),
    Favourites(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    init(context);
    super.initState();
  }

  Future init(BuildContext? context) async {
    // load resources
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 0 ? Colors.pink[500] : Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/search.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 1 ? Colors.pink[500] : Colors.white,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/heart.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 2 ? Colors.pink[500] : Colors.white,
              ),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/user.png',
                width: 24,
                height: 24,
                color: _selectedIndex == 3 ? Colors.pink[500] : Colors.white,
              ),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.pink[500],
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
