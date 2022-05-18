import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khs_flutter_web_now_playing/api/rate_movie.dart';
import '../models/movie.dart';
import '../widgets/rating_bar.dart';

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
  final _filterController = TextEditingController();
  late List<Movie> _baseList;
  late List<Movie> _filteredMovieList;

  @override
  void initState() {
    super.initState();
    _baseList = widget.movieList;
    _filteredMovieList = _baseList;
    _filterController.addListener(_onFilterChange);
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void _onFilterChange() {
    var loweredFilterText = _filterController.text.toLowerCase();
    setState(() {
      _filteredMovieList = _baseList
          .where((movie) => movie.title.toLowerCase().contains(loweredFilterText))
          .toList();
    });
  }

  void _handleMovieNavigation(int id, BuildContext context) {
    context.go("/movies/$id");
  }

  void _handleRatingChange(int movieId, int newRating) async {
    var previousBaseList = _baseList;
    late Movie updatedMovie;

    _baseList = _baseList.map((mov) {
      if (mov.id == movieId) {
        updatedMovie = mov.rebuild((m) => m..rating = newRating);
        return updatedMovie;
      }
      return mov.rebuild((m) => m);
    }).toList();

    try {
      await updateMovie(updatedMovie);
    } on Exception catch (_, e) {
      _baseList = previousBaseList;
      if (kDebugMode) {
        print(previousBaseList);
        print(e);
      }
    }

    _onFilterChange();
  }

  Iterable<Stack> getFilteredMovieWidgets(BuildContext context) {
    return _filteredMovieList.map(
      (m) => Stack(
        key: ObjectKey(m.id),
        alignment: AlignmentDirectional.bottomStart,
        children: [
          InkWell(
            onTap: () {
              _handleMovieNavigation(m.id, context);
            },
            child: Image(
              image: AssetImage(
                'assets/images/posters${m.posterPath}',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
            ),
            child: RatingBar(
              rating: m.rating,
              movieId: m.id,
              onRatingClick: _handleRatingChange,
            ),
          )
        ],
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
            MovieListScreenHeader(filterController: _filterController),
            Wrap(
              children: [...getFilteredMovieWidgets(context)],
            ),
          ],
        ),
      ),
    );
  }
}
