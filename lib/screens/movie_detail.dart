import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khs_flutter_web_now_playing/api/fetch_movie.dart';

import '../models/movie.dart';
import '../widgets/movie_description.dart';

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
  Color _closeIconColor = Colors.white60;

  @override
  void initState() {
    super.initState();
    _futureMovie = fetchMovie(widget.movieId);
  }

  void _onEnterCloseButton(PointerEvent pe) {
    setState(() {
      _closeIconColor = Colors.lightBlue;
    });
  }

  void _onLeaveCloseButton(PointerEvent pe) {
    setState(() {
      _closeIconColor = Colors.white60;
    });
  }

  void _handleCloseButtonClick(BuildContext context) {
    context.go("/movies");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _futureMovie,
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
                        Column(
                          children: [
                            Row(
                              children: [
                                MouseRegion(
                                  onEnter: _onEnterCloseButton,
                                  onExit: _onLeaveCloseButton,
                                  child: IconButton(
                                    onPressed: () {
                                      _handleCloseButtonClick(context);
                                    },
                                    icon: const Icon(Icons.close),
                                    iconSize: 60,
                                    color: _closeIconColor,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            MovieDescription(movie: movie),
                          ],
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
