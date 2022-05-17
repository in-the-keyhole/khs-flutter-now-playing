import 'package:flutter/material.dart';
import '../api/fetch_movies.dart';
import '../models/movie_list.dart';
import '../screens/movie_list_screen.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  late Future<MovieList> futureMovieList;

  @override
  void initState() {
    super.initState();
    futureMovieList = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureMovieList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MovieListScreen(movieList: (snapshot.data as MovieList).results.toList());
        } else if (snapshot.hasError) {
          return Text('There was an error: ${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
