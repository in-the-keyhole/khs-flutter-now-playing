import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khs_flutter_web_now_playing/models/movie.dart';

import 'movie_list_screen_header.dart';

class MovieListScreen extends StatefulWidget {
  final List<Movie> movieList;

  const MovieListScreen({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  var filterController = TextEditingController();
  late List<Movie> filteredMovieList;

  @override
  void initState() {
    super.initState();
    filteredMovieList = widget.movieList;
    filterController.addListener(_onFilterChange);
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  void _onFilterChange() {
    var loweredFilterText = filterController.text.toLowerCase();
    setState(() {
      filteredMovieList = widget.movieList
          .where((movie) => movie.title.toLowerCase().contains(loweredFilterText))
          .toList();
    });
  }

  void handleMovieNavigation(int id, BuildContext context) {
    context.go("/movies/$id");
  }

  Iterable<InkWell> getFilteredMovieWidgets(BuildContext context) {
    return filteredMovieList.map(
      (m) => InkWell(
        onTap: () => handleMovieNavigation(m.id, context),
        child: Image(
          key: ObjectKey(m.id),
          image: AssetImage(
            'assets/images/posters${m.posterPath}',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieListScreenHeader(filterController: filterController),
            Wrap(
              children: [...getFilteredMovieWidgets(context)],
            ),
          ],
        ),
      ),
    );
  }
}
