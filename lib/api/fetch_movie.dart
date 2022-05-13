import 'dart:convert';

import 'package:khs_flutter_web_now_playing/models/serializers.dart';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

Future<Movie> fetchMovie(int id) async {
  final response = await http.get(Uri.parse('http://localhost:3001/api/movies/$id'));

  if (response.statusCode == 200) {
    return deserialize<Movie>(jsonDecode(response.body));
  } else {
    throw Exception('Failed to find move with ID: $id');
  }
}