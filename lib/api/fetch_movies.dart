import 'package:http/http.dart' as http;
import 'package:khs_flutter_web_now_playing/models/movie_list.dart';
import 'dart:convert';

import '../models/serializers.dart';

Future<MovieList> fetchMovies() async {
  final response = await http.get(Uri.parse('http://localhost:3001/api/nowPlaying'));

  if (response.statusCode == 200) {
    return deserialize<MovieList>(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}