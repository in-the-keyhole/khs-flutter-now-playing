import 'package:flutter/material.dart';
import 'package:khs_flutter_web_now_playing/api/fetch_movie.dart';
import 'package:khs_flutter_web_now_playing/models/serializers.dart';

import '../models/movie.dart';

const myText =
    '12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 12323 123123 123213 1231232 ';

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
  late Future<Movie> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: futureMovie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Movie movie = snapshot.data as Movie;
                return SizedBox.expand(
                  child: Container(
                    color: Colors.black87,
                    child: Stack(
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/backdrops/${movie.backdropPath}'),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(movie.overview),
                        )
                      ],
                      fit: StackFit.expand,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('There was an error: ${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }));
  }
}
