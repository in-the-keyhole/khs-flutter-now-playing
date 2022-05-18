import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khs_flutter_web_now_playing/models/serializers.dart';

import '../models/movie.dart';

Future<void> updateMovie(Movie updatedMovie) async {
  final response = await http.put(Uri.parse('http://localhost:3001/api/movies/${updatedMovie.id}'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json, text/plain, */*'},
      body: jsonEncode(serializers.serializeWith(Movie.serializer, updatedMovie)));

  if (response.statusCode >= 200 && response.statusCode <= 299) {
    return;
  } else {
    throw Exception('Failed to update movie');
  }
}
