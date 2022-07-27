import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../api/authenticate.dart';

class AuthService extends ChangeNotifier {
  bool get isLoggedIn => GetStorage().read('token') != null;

  Future<void> authenticateUser(String username, String password) async {
    final user = await authenticate(username, password);

    GetStorage().write('token', user.token);

    notifyListeners();
  }

  void logout() {
    GetStorage().remove('token');

    notifyListeners();
  }
}
