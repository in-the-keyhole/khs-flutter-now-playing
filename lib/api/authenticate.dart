import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khs_flutter_web_now_playing/models/serializers.dart';

import '../models/user.dart';

Future<User> authenticate(String username, String password) async {
  final response =
      await http.post(Uri.parse('http://localhost:3001/api/authenticate'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json, text/plain, */*'
          },
          body: jsonEncode({'username': username, 'password': password}));

  if (response.statusCode >= 200 && response.statusCode <= 299) {
    return deserialize<User>(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login');
  }
}
