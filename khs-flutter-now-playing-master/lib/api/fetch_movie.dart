import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'todo.dart';
import '../creds/creds.dart';
import 'gql_parser.dart';
import 'package:khs_flutter_web_now_playing/models/serializers.dart';

import '../models/movie.dart';
import 'package:http/http.dart' as http;

const parser = GqlParser('bin/graphql');


Future<Movie> fetchMovie(int id) async {
  final response =
      await http.get(Uri.parse('http://localhost:3001/api/movies/$id'));

  if (response.statusCode == 200) {
    return deserialize<Movie>(jsonDecode(response.body));
  } else {
    throw Exception('Failed to find move with ID: $id');
  }
}
