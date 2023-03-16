import 'package:flutter/material.dart';
import 'package:movie_buddy/screens/home/top_rated_movies.dart';
import 'package:movie_buddy/screens/home/trending_movies.dart';

import '../../components/SectionTitle/section_title.dart';
import 'category_menu_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  int categoryId = 0;

  final List<String> categories = [
    'All',
    'Action',
    'Comedy',
    'Horror',
    'Animation',
    'Romance',
    'War',
    'Sci-Fi',
    'Drama',
    'Family',
    'Thriller',
    'Mystery',
    'Crime',
    'Adventure',
    'Fantasy',
    'Superhero',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 80.0,
            flexibleSpace: const FlexibleSpaceBar(
              background: Center(
                child: Text(
                  'M',
                  style: TextStyle(
                      color: Color(0xFFE50593),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FingerPaint'),
                ),
              ),
            ),
            leading: IconButton(
              icon: Image.asset(
                'assets/images/menus.png',
                width: 24,
                height: 24,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  'assets/images/filter.png',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: SectionTitle(title: 'Trending Movies'),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: const TrendingMovies(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SectionTitle(title: 'Category'),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryMenuItem(
                    index: index,
                    title: categories[index],
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SectionTitle(title: 'Top Rated'),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: const TopRatedMovies(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SectionTitle(title: 'Top Rated'),
          ),
        ],
      ),
    );
  }
}
