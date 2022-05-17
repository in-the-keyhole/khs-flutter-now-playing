import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/close_btn.dart';
import '../widgets/movie_description.dart';

class MovieDetailScreen extends StatelessWidget {
  final Function(BuildContext context) onClose;

  const MovieDetailScreen({
    Key? key,
    required this.movie,
    required this.onClose,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
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
                      CloseBtn(onClose: onClose),
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
      ),
    );
  }
}