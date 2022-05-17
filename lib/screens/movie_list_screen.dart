import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khs_flutter_web_now_playing/models/movie.dart';
import 'package:khs_flutter_web_now_playing/widgets/rating_bar.dart';

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
  late List<Movie> _filteredMovieList;

  @override
  void initState() {
    super.initState();
    _filteredMovieList = widget.movieList;
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
      _filteredMovieList = widget.movieList
          .where((movie) => movie.title.toLowerCase().contains(loweredFilterText))
          .toList();
    });
  }

  void _handleMovieNavigation(int id, BuildContext context) {
    context.go("/movies/$id");
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
            padding: EdgeInsets.only(
              left: 15,
              bottom: 15,
            ),
            child: RatingBar(rating: m.rating,),
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
