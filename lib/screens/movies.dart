import 'package:flutter/material.dart';
import 'package:khs_flutter_web_now_playing/api/fetch_movies.dart';
import 'package:khs_flutter_web_now_playing/models/movie_list.dart';
import 'package:khs_flutter_web_now_playing/screens/movie_list.dart';

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
    return Scaffold(
      body: FutureBuilder(
          future: futureMovieList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MovieListScreen(movieList: (snapshot.data as MovieList).results.toList());
            } else if (snapshot.hasError) {
              return Text('There was an error: ${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },),
    );
  }
}
