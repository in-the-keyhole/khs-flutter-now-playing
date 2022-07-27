import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khs_flutter_web_now_playing/api/fetch_movie.dart';

import '../models/movie.dart';
import '../screens/movie_detail_screen.dart';

class MovieDetail extends StatefulWidget {
  final int movieId;

  const MovieDetail({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<Movie> _futureMovie;

  @override
  void initState() {
    super.initState();
    _futureMovie = fetchMovie(widget.movieId);
  }

  void _handleCloseButtonClick(BuildContext context) {
    context.go("/movies");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureMovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Movie movie = snapshot.data as Movie;
          return MovieDetailScreen(
            movie: movie,
            onClose: _handleCloseButtonClick,
          );
        } else if (snapshot.hasError) {
          return Text('There was an error: ${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
